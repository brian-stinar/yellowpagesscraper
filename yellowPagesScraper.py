#!/usr/bin/python
# -*- coding: latin-1 -*-

# import dryscrape - scraping library not working so well - it looks like YellowPages is doing some tricky stuff for Webkit based browsers
import urllib2 #-- same nastiness as above.
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
    
    
    
    def spider(self, keyWord, zipcode):
        # set up a web scraping session
        keyWordDashes = keyWord.replace(' ', '-')
        keyWordPlus = keyWord.replace(' ', '+')
        
        url = self.url + zipcode + '/' + keyWordDashes + '?q=' + keyWordPlus
        response = urllib2.urlopen(url)
        html = response.read()
        
        print html

        #http://www.yellowpages.com/87106/sports-gym?q=Sports+Gym

        '''
        sess = dryscrape.Session(base_url = 'http://www.yellowpages.com')
    
        # we don't need images
        sess.set_attribute('auto_load_images', False)
    
        # visit homepage and submit a login
        sess.visit('/')
        searchTerms = sess.at_xpath('//*[@name="search_terms"]')
        searchTerms.set(keyWord)
        searchLocation = sess.at_xpath('//*[@name="geo_location_terms"]')
        searchLocation.set(location)
        
        self.shortRandomSleep() # Otherwise, we get a Operation canceled (error code 5) - likely because yellow pages doesn't want us hitting them as fast as possible
        
        searchTerms.form().submit()
        self.shortRandomSleep()
        sessionString = sess.body()
    
        print sessionString
        '''

if __name__ == "__main__":
    scraper = YellowPagesScraper()
    scraper.spider("Gym", "87106")