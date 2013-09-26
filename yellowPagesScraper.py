#!/usr/bin/python
# -*- coding: UTF-8 -*-

from bs4 import BeautifulSoup
import time
import random
import os
import datetime
import MySQLdb
import sys
import subprocess
import re


class YellowPagesScraper():
    
    def __init__(self):
        self.pagePosition = 0 # Where are we in our page list
        self.shortSleepMaxSeconds = 5
        
        self.mediumSleepMinSeconds = 5
        self.mediumSleepMaxSeconds = 30
        
        self.url = "http://www.yellowpages.com/"
        self.resultsPerPage = 30
        
        self.baseUrl = ""
        self.businessList = []
        
        now = datetime.datetime.now() # Get the current datetime
        self.nowString =  str(now.year)  + '.' + str(now.month) + '.' + str(now.day) + '.' + str(now.hour) 
        if not os.path.isdir(self.nowString):
            os.mkdir(self.nowString) # make a directory with the data, if it doesn't exist 
        os.chdir(self.nowString) # change into this directory
    
    # TODO - shared code between these two methods. Abstract out the commonalities.
    def shortRandomSleep(self):
        sleepTime = random.random() * self.shortSleepMaxSeconds
        print("sleeping for " + str(sleepTime) + ' seconds')
        time.sleep(sleepTime)
    
    
    def mediumRandomSleep(self):
        sleepTime = self.mediumSleepMinSeconds + random.random() * (self.mediumSleepMaxSeconds - self.mediumSleepMinSeconds)
        print("sleeping for " + str(sleepTime) + ' seconds')
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

        if (startPage > endPage):
            sys.stderr.write("startPage > endPage --- no good")
        
        url = self.calculateBaseUrl(keyWord, zipcode)
        command = 'wget –quiet --output-document ' + str(startPage) + '.html ' + url
        print command
        
        # works - wget is outputting progress to stderror?!? When I am bored, fix this in their source control
        process = subprocess.Popen(command.split(), shell=False, stdout=open(os.devnull, 'wb'), stderr=open(os.devnull, 'wb'))
        process.wait()
        if (endPage == 1):
            return
                
        i = startPage
        
        while i < range(endPage):
            # The first URL is different
            if i == 1:
                continue
            self.mediumRandomSleep()

            #http://www.yellowpages.com/87106/sports-gym?o=0&page=2&q=Sports+Gym
            url = self.calcualteSubsequentUrl(keyWord, zipcode, i)
            print url
            command = 'wget –quiet --output-document ' + str(i) + '.html ' + url
            print command
            # works - wget is outputting progress to stderror?!? When I am bored, fix this in their source control
            process = subprocess.Popen(command.split(), shell=False, stdout=open(os.devnull, 'wb'), stderr=open(os.devnull, 'wb'))
            process.wait()
            i = i + 1
    
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
            
            sys.stderr.write("Could not determine the number of results... Exiting")
            sys.exit(-1)    
            

    def calculateTotalNumberOfResultsPages(self, maxNumerOfResults):
        if (maxNumerOfResults % self.resultsPerPage == 0):
            return maxNumerOfResults / self.resultsPerPage
        else:
            return (maxNumerOfResults / self.resultsPerPage + 1)
    
    def parsePages(self):
        # Get a page listing of all the pages in the current directory
        fileList = os.listdir(".")
        print ("Parsing files in the list : " + str(fileList)) + "\n"
        
        for fileName in fileList:
            print "\nPresently parsing - " + fileName + "\n"
            soup = BeautifulSoup(open(fileName))
         
            businesses = soup.findAll("div", {"class" : "info"})
            for business in businesses:
                name = business.find("div", {"class" : "srp-business-name"}).getText().strip()
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
                
                self.businessList.append((name, phone, streetAddress, city, state, website))
        

    def insertBusinessesIntoDatabase(self): 
        
        try:
            connection = MySQLdb.connect(host= "localhost",
                  user="yellowpages",
                  passwd="FbhPWnZiltkNbQ==",
                  db="yellowpages")

            cursor = connection.cursor()

            for business in self.businessList:
                now = datetime.datetime.now()
                cursor.execute("""INSERT INTO spiderResults (name, phone, streetAddress, city, state, website, timeScraped) VALUES (%s, %s, %s, %s, %s, %s, %s)""", (business[0], business[1], business[2], business[3], business[4], business[5], now))
                #print command               
                #cursor.execute("""INSERT INTO spiderResults (name, phone, streetAddress, city, state, website) VALUES (%s, %s, %s, %s, %s, %s)""", 
                #               (business[0], business[1], business[2], business[3], business[4], business[5], now))
                connection.commit()
            connection.close()    
        
        except MySQLdb.Error, e:
            print "Error %d: %s" % (e.args[0], e.args[1])
            sys.exit(1)

        
        
if __name__ == "__main__":
    scraper = YellowPagesScraper()
    
    # Grab the first page, calculate the maxPages, and then grab all the pages
    
    scraper.spider("gym", "87106", 1, 1)
    maxResults = scraper.getMaxNumberOfResults("1.html")
    maxPages = scraper.calculateTotalNumberOfResultsPages(maxResults)
#   scraper.spider("gym", "87106", 2, maxPages) # I can check to see what's in the directory
    
    #scraper.parsePages()
    #scraper.insertBusinessesIntoDatabase()