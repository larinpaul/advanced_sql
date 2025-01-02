-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 2024 01 02

-- Relational databases (RDBMS) often support mathematical and statistical operations
-- that can be executed using SQL, like addition, subtraction, multiplication,
-- division, finding an average, summing numbers, counting records,
-- calculating variance and standard deviation, and manipulating dates.

-- Variance:
-- The variance is a measure of how much the individual data points 
-- in a dataset deviate from the mean value.
-- It's calculated as the average of the squared differences
-- between each data point and the mean.
-- Formula:
-- Variance = Sum(xi - mu)^2 / (n - 1)
-- where:
-- * xi is each individual data point
-- * mu is the mean of the dataset
-- * n is the number of data points
-- * Sum denotes the sum of the squared differences

-- Standard deviation:
-- The standard deviation is the square root of the variance.
-- It's a measure of amount of variation or dispersion
-- of a dataset from the mean value
-- Formula:
-- StandardDeviation = Sqrt(Variance)

-- Variation:
-- Variation refers to the differences or fluctuations in a dataset or a population
-- It's a measure of how much the individual data points deviate 
-- from the mean or expected value.
-- Variation can be caused by various factors, such as measurement errors,
-- sampling errors, or natural fluctuations in the data.
-- Dispersion:
-- The spread or scattering of data points in a dataset.
-- It's a measure of how spread out the data points are
-- from the mean or central tendency.
-- Dispersion can be measured using various statistics,
-- such as the range, variance, or standard deviation.

-- Mean:
-- The mean, also known as the arithmetic mean,
-- is a measure of the central tendency of a dataset.
-- It's a way to describe the average value of a set of numbers.
-- Formula:
-- The mean is calculated by summing up all the values in a dataset
-- and dividing by the number of values.
-- Mean = (Sumxi) / n
-- where:
-- * xi is each individual value in the dataset
-- * n is the number of values in the dataset
-- * Sum denotes the sum of the value

-- Median:
-- The median is a measure of central tendency that represents the middle value
-- of a dataset when it is sorted in ascending or descending order.
-- It's a way to describe the average value of a set of numbers,
-- but it's more robust than the mean
-- and less sensitive to outliers
-- Formula:
-- * Sort the dataset in ascendingo rder: 2,4,6,8,10
-- * Find the middle value: 6 (since there are 5 values,
-- the middle value is the 3rd value). 
-- In this example, the median is 6.

-- By learning advanced SQL concepts, you'll be able to transform data
-- into summary statistics which is an effective way to begin understanding
-- how your data can help you make decisions.
-- Here are some of the commonly used aggregate functions
-- for data analysis:
-- * COUNT()
-- * AVG()
-- * MIN()
-- * MAX()
-- * MAX()
-- * SUM()
-- * StDEV()
-- * VAR()

-- There are two ways to use COUNT():
-- * COUNT(*) return a count of rows that includes null values.
-- * COUNT(column_name) returns a count of records excluding the null values.

-- If we want to count how many records are in the CLIENT table,
-- we use a query like this:
SELECT COUNT(*) AS records FROM client

-- As expected, a count of four returns since we have four records in the client table.

-- If we want to count hwo many records have a value in the gender field,
-- we use a query like this:

SELECT COUNT(gender) as genderCount FROM client

-- Notice we onyl count 3 records with a value in the gender field
-- because Alex Porter's gneder is NULL.
-- A Null means the field is empty; it contains no value.
