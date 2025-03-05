-- 2025 03 04 -- 6:11

-- https://careerfoundry.com/en/tutorials/data-analytics-for-beginners/introduction-to-data-cleaning

-- Tutorial 2: An Introduction to Data Cleaning


-- ...

-- What is dirty data?

-- * Incomplete data -- for example, a spreadsheet with missing values that would berelevant for your analysis
-- * Duplicate data
-- * Inconsistent or inaccurate data -- data that is outdated or contains structural errors
-- such as typos, inconsistent capicatiozation, and irregular naming conventions.
-- For example some are "Pass" or "Fair" and others are "P" or "F".

-- 7 most common types of dirty data and how to clean them
-- https://pipeline.zoominfo.com/operations/dirty-data-bottom-line

-- ...

-- data experts spend a good 60% of their time on data cleaning.


-- 2. What are some key steps in the data cleaning process?
-- Delete unnecessary columns
-- Identify and remove duplicates
-- Deal with missing data
-- Remove unwanted outliers
-- Fix inconsistencies


-- 3. Practical exercise: Cleaning your dataset

-- Now let's apply the knowledge about data cleaning to the Citi Bike dataset, we'll focus on:
-- 1. Identifying and removing duplicates
-- 2. Identifying and handling missing data points

-- Task 1: Identify and remove duplicates
-- 1. Log in to your Google account.
-- Make a copy of this view-only dataset -- https://docs.google.com/spreadsheets/d/1D7y7LfBG-owIkXOiabRfFG0XcEzQS_8Lz5BsnRkVT3E/edit#gid=845159259
-- 2. Find andremove the replicates:
-- Click the gray rectangle to the left of column A and above row 1.
-- Click "Data" - "Remove duplicates"
-- The dataset contained over 3500 duplicate rows!
-- There could be some problems like not enough space in a hard drive, file size, software space needed to run, etc...

-- Because you've removed all those thousands of duplicate rows, 
-- you'll be left with empty rows in your dataset.
-- We're going to remove those, too:


-- You can use filter to clear or select all...
-- Then you can remove filter
