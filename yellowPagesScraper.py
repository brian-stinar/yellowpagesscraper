#!/usr/bin/python
# -*- coding: UTF-8 -*-

# Yellowpages.com scraper
# Written by Brian J. Stinar
# 505-750-1169


from bs4 import BeautifulSoup
import time
import random
import os
import datetime
import MySQLdb
import sys
import subprocess
import re
import argparse
import shutil

class YellowPagesScraper():
    
    def __init__(self, minSleep=5, maxSleep=30):
        
        self.mediumSleepMinSeconds = minSleep
        self.mediumSleepMaxSeconds = maxSleep
        
        self.url = "http://www.yellowpages.com/"
        self.resultsPerPage = 30
        
        self.businessList = []
        
        self.debug = False
        
        now = datetime.datetime.now() # Get the current datetime
        self.nowString =  str(now.year)  + '.' + str(now.month) + '.' + str(now.day) + '.' + str(now.hour) 
        if not os.path.isdir(self.nowString):
            os.mkdir(self.nowString) # make a directory with the data, if it doesn't exist 
        os.chdir(self.nowString) # change into this directory
                
    def cleanUp(self):
        os.system("rm -rf ../" + self.nowString)
        sys.exit(1)

           
    def mediumRandomSleep(self):
        sleepTime = self.mediumSleepMinSeconds + random.random() * (self.mediumSleepMaxSeconds - self.mediumSleepMinSeconds)
        print("\t\tsleeping for " + str(sleepTime) + ' seconds')
        time.sleep(sleepTime)

    
    def calculateBaseUrl(self, keyWord, zipcode):
        keyWordDashes = keyWord.replace(' ', '-')
        keyWordPlus = keyWord.replace(' ', '+')
        url = self.url + zipcode + '/' + keyWordDashes + '?q=' + keyWordPlus
        return url


    def calcualteSubsequentUrl(self, keyWord, zipcode, currentPageGrabbing):
        keyWordDashes = keyWord.replace(' ', '-')
        keyWordPlus = keyWord.replace(' ', '+')
        url = self.url + zipcode + '/' + keyWordDashes + '?o=0&page=' + str(currentPageGrabbing) + '?q=' + keyWordPlus
        return url


    # set up a web scraping session
    def spider(self, keyWord, zipcode, startPage, endPage):        

        print "startPage = " + str(startPage)
        print "endPage = " + str(endPage)

        if (startPage > endPage):
            sys.stderr.write("startPage > endPage --- no good")

        if (endPage == 1):
            print("\tGrabbing page " + str(startPage) + " of " + str(endPage))
            url = self.calculateBaseUrl(keyWord, zipcode)
            command = 'wget –quiet --output-document ' + str(startPage) + '.html ' + url
            #print command
    
            # works - wget is outputting progress to stderror?!? When I am bored, fix this in their source control
            process = subprocess.Popen(command.split(), shell=False, stdout=open(os.devnull, 'wb'), stderr=open(os.devnull, 'wb'))
            process.wait()

            self.mediumRandomSleep()
            return
                
        i = startPage

        while i <= endPage:
            # The first URL is different
            if i == 1:
                continue

            #http://www.yellowpages.com/87106/sports-gym?o=0&page=2&q=Sports+Gym
            url = self.calcualteSubsequentUrl(keyWord, zipcode, i)
            command = 'wget –quiet --output-document ' + str(i) + '.html ' + url
            print("\tGrabbing page " + str(i) + " of " + str(endPage))
            #print command
            # works - wget is outputting progress to stderror?!? When I am bored, fix this in their source control
            process = subprocess.Popen(command.split(), shell=False, stdout=open(os.devnull, 'wb'), stderr=open(os.devnull, 'wb'))
            process.wait()
            i = i + 1
            self.mediumRandomSleep()

    
    def getMaxNumberOfResults(self, pageFileName):
        soup = BeautifulSoup(open(pageFileName))
        totalResults = soup.find("div", {"class" : "result-totals"})
        if totalResults != None:
            results = totalResults.getText().split("of")[1].strip().split()[0]
            return int(results)

        # Yellow Pages Is Jacking with Us and doing tons of stuff in JavaScript
        else:
            # Use links to get the maximum page results. Links is a browser that can make their results look better
            command = "links -dump 1.html"
            outfile = open("clean.html", 'w')
            process = subprocess.Popen(command.split(), shell=False, stdout=outfile)
            process.wait()
            outfile.flush()
            outfile.close()
            
            # Showing 1-30 of 137 results            
            with open("clean.html") as cleanFile:
                for line in cleanFile:
                    matchObject = re.match(r'.*Showing 1-30 of(.*)results.*', line)
                    if matchObject:
                        matchline =  matchObject.group()
                        match = matchline.split("Showing 1-30 of ")[1].split()[0].strip()
                        return int(match)
                       
            return self.resultsPerPage            
            # This may not be an error. For single page results, we only have the first page.
            #sys.stderr.write("Could not determine the number of results... Exiting")
            #sys.exit(-1)    
            

    def calculateTotalNumberOfResultsPages(self, maxNumerOfResults):
        if (maxNumerOfResults % self.resultsPerPage == 0):
            return maxNumerOfResults / self.resultsPerPage
        else:
            return (maxNumerOfResults / self.resultsPerPage + 1)

    
    def parsePages(self):
        # Get a page listing of all the pages in the current directory
        fileList = os.listdir(".")
        print ("Parsing files in the list : " + ", ".join(fileList))
        
        for fileName in fileList:
            print "Presently parsing - " + fileName
            inputFile = open(fileName)
            soup = BeautifulSoup(inputFile)
            inputFile.close()
            
            date = datetime.datetime.fromtimestamp(os.path.getmtime(fileName))
            
            # either 'info' or 'info-business'
            businesses = soup.findAll("div", {"class" : "info"})
            if len(businesses) == 0:
                businesses = soup.findAll("div", {"class" : "info-business"})
            
            if len(businesses) == 0:
                # Try throwing away the first line, Yellow Pages added a dummy HTML doc at the head to mess with me
                print("Yellowpages.com adds a dummy HTML document at the head, and then hides/shows with JavaScript. Ditching the dummy to parse...")
                inputFile = open(fileName)
                lines = "".join(inputFile.readlines()[1:]) # TODO - do this better
                
                inputFile.close()
                soup = BeautifulSoup(lines)
                businesses = soup.findAll("div", {"class" : "business-container-inner"})    
                  
            
            if len(businesses) > 0:
                print "\tFound " + str(len(businesses)) + " businesses to parse"             
                for business in businesses:

                    name = business.find("div", {"class" : "srp-business-name"}).getText().strip()
                    name=name.replace('\n', ' ') # Some of these have newlines in them...?
                    name=name.replace('/', ' ') # and slashes 
                    name = name.encode('ascii', 'ignore') # and unicode

                    webAddress = business.find("div", {"class" : "srp-business-name"})
                    if webAddress.a.has_attr('href'):
                        individualYellowPagesLink = str(webAddress.a['href'])
                        # Now, grab the information from this page, and try to find an email address.
                        email = self.findEmail(individualYellowPagesLink, name)
                        if (email != None):
                                date = datetime.datetime.now()
                                print date
                                print " Found an email - using the most recent timestamp"
                    
                    phone = business.find("span", {"class" : "business-phone"}).getText().strip()                    
                    
                    # TODO -- All this != None stuff is the same - make this into a 'private' method
                    streetAddress = business.find("span", {"class" : "street-address"}) # May be empty
                    if (streetAddress != None):
                        streetAddress = streetAddress.getText().strip()[:-1] # Throw away the trailing comma
                    else:
                        streetAddress = ""
                    
                    cityState = business.find("span", {"class" : "city-state"}) # May be empty
                    if cityState != None:
                        cityState = cityState.getText().strip()
                        city = cityState.split('\n')[0][:-1] # Trailing comma
                        state = cityState.split('\n')[1]
                    else:
                        city = ""
                        state = "" 
                    
                    zipCode = business.find("span", {"class" : "postal-code"})
                    if zipCode != None:
                        zipCode = zipCode.getText().strip()
                    else:
                        zipCode = ""
                    
                    website = business.find("li", {"class" : "website-feature"}) # Also may be empty
                    if website != None:
                        website =  website.find('a')['href'] # This seems like I could do this better, without the find
                    else:
                        website = ""
                    
                    self.businessList.append((name, phone, streetAddress, city, state, website, date, email))


    def findEmail(self, individualYellowPagesLink, businessName):
        
        businessName = businessName.replace(" ", "_")

        
        # Grab the individual business page here.
        #command = 'wget -quiet --output-document ' + str(businessName).strip() + " " + individualYellowPagesLink
        command = 'wget –quiet --output-document ' + str(businessName) + '.html ' + individualYellowPagesLink
                
        #print "command = " + command
        #self.mediumRandomSleep()
        #process = subprocess.Popen(command.split(), shell=True)
        print "\t\tLooking for email for business " + businessName
        print "\t\t" + str(command.split())
        process2 = subprocess.Popen(command.split(), shell=False, stdout=open(os.devnull, 'wb'), stderr=open(os.devnull, 'wb'))
        process2.wait()
        
        lines = open(businessName + '.html', 'r').readlines()
        
        match = None
        
        for line in lines:
            matchObject = re.match(r'.*mailto:(.*)"', line)
            
            if matchObject:
                match =  matchObject.group().split("mailto")[1]
                match = match.split('"')[0][1:]               
                print "match = " + match
                break
        
        process2 = subprocess.Popen(["rm", "-rf", str(businessName) + '.html'])
        
        return match
                            

    def insertBusinessesIntoDatabase(self): 
        
        try:
            connection = MySQLdb.connect(host= "localhost",
                  user="yellowpages",
                  passwd="FbhPWnZiltkNbQ==", # Randomly generated password which is not used for anything else.
                  db="yellowpages")

            cursor = connection.cursor()

            for business in self.businessList:
		try:
                    #print "processing " + str(business)
                    cursor.execute("""INSERT INTO spiderResults (name, phone, streetAddress, city, state, website, timeScraped, email, source) 
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 'yellowPages')""", 
                        (business[0], business[1], business[2], business[3], business[4], business[5], business[6], business[7])) # TODO, make this a map, then my parameters are named.
                    connection.commit()
        	except MySQLdb.Error, e:
                    sys.stderr.write("Error processing " + str(business) + "\n")
                    sys.stderr.write("Error %d: %s" % (e.args[0], e.args[1]))
                    sys.exit(1)
                    continue    
	    connection.close()    
        
        except MySQLdb.Error, e:
            print "Error %d: %s" % (e.args[0], e.args[1])
		
            sys.exit(1)


def buildCommandLine():
    parser = argparse.ArgumentParser(description='Connect to yellowpages.com, and scrape away!')

    parser.add_argument("--maxSleep", type=int,
                    help="maximum sleep time between page requests", default=30)
    parser.add_argument("--minSleep", type=int,
                    help="minimum sleep time between page requests", default=5)
    parser.add_argument("keyword", help="Keyword to search for")
    parser.add_argument("zipcode", help="Zip code to search in ")
    return parser

        
if __name__ == "__main__":
    
    args = buildCommandLine().parse_args()
    
    scraper = YellowPagesScraper(args.minSleep, args.maxSleep)

    # Grab the first page, calculate the maxPages, and then grab all the pages
    print("Grabbing first page of directory listings to calculate the total page count")
    scraper.spider(args.keyword, args.zipcode, 1, 1)
    maxResults = scraper.getMaxNumberOfResults("1.html")
    print "maxResults = " + str(maxResults)    
    maxPages = scraper.calculateTotalNumberOfResultsPages(maxResults)
    print "maxPages = " + str(maxPages)

    if maxPages - 1 > 1:
        print("There are " + str(maxPages) + " top level pages to grab. One of which is complete.")
        print("The remaining " + str(maxPages-1) + " will take between " + str((maxPages-1) * scraper.mediumSleepMinSeconds) + " seconds and " + str((maxPages-1) * scraper.mediumSleepMaxSeconds) + " seconds to complete.")
        scraper.spider(args.keyword, args.zipcode, 2, maxPages) # I can check to see what's in the directory

    scraper.parsePages()
    scraper.insertBusinessesIntoDatabase()
    
    scraper.cleanUp()
