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
        self.url = "http://www.yellowpages.com/"
        
        now = datetime.datetime.now() # Get the current datetime
        self.nowString =  str(now.year)  + '.' + str(now.month) + '.' + str(now.day) + '.' + str(now.hour) 
        if not os.path.isdir(self.nowString):
            os.mkdir(self.nowString) # make a directory with the data, if it doesn't exist 
        os.chdir(self.nowString) # change into this directory
    
    
    def shortRandomSleep(self):
        time.sleep(random.random() * self.shortSleepMaxSeconds)
    
    
    
    def spider(self, keyWord, zipcode, numberOfPagesToGrab=1):
        # set up a web scraping session
        keyWordDashes = keyWord.replace(' ', '-')
        keyWordPlus = keyWord.replace(' ', '+')

        currentPage = 1         
        url = self.url + zipcode + '/' + keyWordDashes + '?q=' + keyWordPlus
        command = 'wget --output-document ' + str(currentPage) + '.html ' + url
        os.system(command)
        
if __name__ == "__main__":
    scraper = YellowPagesScraper()
    scraper.spider("Gym", "87106")