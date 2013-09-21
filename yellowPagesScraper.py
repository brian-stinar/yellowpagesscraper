#!/usr/bin/python
# -*- coding: latin-1 -*-

from bs4 import BeautifulSoup
import time
import random
import os
import datetime

class YellowPagesScraper():
    
    def __init__(self):
        self.pagePosition = 0 # Where are we in our page list
        self.shortSleepMaxSeconds = 5
        self.mediumSleepMaxSeconds = 30
        self.url = "http://www.yellowpages.com/"
        
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
        sleepTime = random.random() * self.mediumSleepMaxSeconds
        print("sleeping for " + str(sleepTime) + ' seconds')
        time.sleep(sleepTime)
    
    
    def spider(self, keyWord, zipcode, numberOfPagesToGrab=1):
        # set up a web scraping session
        keyWordDashes = keyWord.replace(' ', '-')
        keyWordPlus = keyWord.replace(' ', '+')

        currentPage = 1         
        url = self.url + zipcode + '/' + keyWordDashes + '?q=' + keyWordPlus
        print url
        command = 'wget --output-document ' + str(currentPage) + '.html ' + url
        print command
        os.system(command)
        currentPage = 2
        
        for i in range(numberOfPagesToGrab):
            # The first URL is different
            if i == 1:
                continue
            self.mediumRandomSleep()

            #http://www.yellowpages.com/87106/sports-gym?o=0&page=2&q=Sports+Gym
            url = self.url + zipcode + '/' + keyWordDashes + '?o=0&page=' + str(currentPage) + '?q=' + keyWordPlus
            print keyWordDashes
            print url
            command = 'wget --output-document ' + str(currentPage) + '.html ' + url
            print command
            os.system(command)
            currentPage = currentPage + 1
    
    def parsePages(self):
        # Get a page listing of all the pages in the current directory
        fileList = os.listdir(".")
        for fileName in fileList:
            continue
        
if __name__ == "__main__":
    scraper = YellowPagesScraper()
    # scraper.spider("Gym", "87106", 5)
    scraper.parsePages()