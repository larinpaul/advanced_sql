-- 2025 01 31

-- 14.1 Built-In Function and Operator Reference
-- https://dev.mysql.com/doc/refman/8.4/en/built-in-function-reference.html

-- The following table lists each built-in (native) function and operator
-- and provides a short description of each one.
-- For a table listing function that are loadable at runtime, see 
-- Section 14.2, "Loadable Function Reference" -- https://dev.mysql.com/doc/refman/8.4/en/loadable-function-reference.html


-- Table 14.1. Built-In Functions and Operators

-- Name -- Description -- Deprecated
&
>
>>
>=
<
<>,!=
<<
<=
<=>
%,MOD
*
+
-
-
->
->>
/
:=
=
=
^
ABS()
ACOS()
ADDDATE()
ADDTIME()
AES_DECRYPT()
AES_ENCRYPT()
AND,&&
ANY_VALUE()
ASCII()
ASIN()
asynchronous_connection_failover_add_managed()
asynchronous_connection_failover_add_source()
asynchronous_connection_failover_delete_managed()
asynchronous_connection_failover_delete_source()
asynchronous_connection_failover_reset()
ATAN()
ATAN2(),ATAN()
AVG()
BENCHMARK()
BETWEEN ... AND ...
BIN()
BIN_TO_UUID()
BINARY
BIT_AND()
BIT_COUNT()
BIT_LENGTH()
BIT_OR()
BIT_XOR()
CAN_ACCESS_COLUMN()
CAN_ACCESS_DATABASE()
CAN_ACCESS_TABLE()
CAN_ACCESS_USER()
CAN_ACCESS_VIEW()
CASE
CAST()
CEIL()
CEILING()
CHAR()
CHAR_LENGTH()
CHARACTER_LENGTH()
CHARSET()
COALESCE()
COERCIBILITY()
COLLATION()
COMPRESS()
CONCAT()
CONCAT_WS()
CONNECTION_ID()
CONV()
CONVERT()
CONVERT_TZ()
COS()
COT()
COUNT()
COUNT(DISTINCT)
CRC32()
CUME_DIST()
CURDATE()
CURRENT_DATE(), CURRENT_DATE
CURRENT_ROLE()
CURRENT_TIME(), CURRENT_TIME
CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP
CURRENT_USER(), CURRENT_USER
CURTIME()
DATABASE()
DATE()
DATE_ADD()
DATE_FOMRAT()
DATE_SUB()
DATEDIFF()
DAY()
DAYNAME()
DAYOFMONTH()
DAYOFWEEK()
DAYOFYEAR()
DEFAULT()
DEGRESS()
DENSE_RANK()
DIV
ELT()
EXISTS()
EXP()
EXPORT_SET()
EXTRACT()
ExtractValue()
FIELD()
FIND_IN_SET()
FIRST_VALUE()
FLOOR()
FORMAT()
FORMAT_BYTES()
FORMAT_PICO_TIME()
FOUND_ROWS()
FROM_DAYS()
FROM_UNIXTIME()
GeomCollection()
GeometryCollection()
GET_DD_COLUMN_PRIVILEGES()
GET_DD_CREATE_OPTIONS()
GET_DD_INDEX_SUB_PART_LENGTH()
GET_FORMAT()
GET_LOCK()
GREATEST()
GROUP_CONCAT()
group_replication_disable_member_action()
group_replication_enable_member_action()
group_replication_get_communication_protocol()
group_replication_get_write_concurrency()
group_replication_reset_member_actions()
group_replication_set_as_primary()
group_replication_set_communication_protocol()
group_replication_set_write_concurrency()
group_replication_switch_to_multi_primary_mode()
group_replication_switch_to_single_primary_mode()
GROUPING()
HEX()
HOUR()
ICU_VERSION()
IF()
IFNULL()
IN()
INET_ATON()
INET_NTOA()
INSERT()
INSTR() -- Return the index of the first occurrence of substring
INTERNAL_AUTO_INCREMENT()
INTERNAL_AVG_ROW_LENGTH()
INTERNAL_CHECK_TIME()
INTERNAL_CHECKSUM()
INTERNAL_DATA_FREE()
INTERNAL_DATA_LENGTH()
INTERNAL_DD_CHAR_LENGTH()
INTERNAL_GET_COMMENT_OR_ERROR()
INTERNAL_GET_ENABLED_ROLE_JSON()
INTERNAL_GET_HOSTNAME()
INTERNAL_GET_USERNAME()
INTERNAL_GET_VIEW_WARNING_OR_ERROR()
INTERNAL_GET_INDEX_COLUMN_CARDINALITY()
INTERNAL_INDEX_LENGTH()
INTERNAL_IS_ENABLED_ROLE()
INTERNAL_IS_MANDATORY_ROLE()
INTERNAL_KEYS_DISABLED()
INTERNAL_MAX_DATA_LENGTH()
INTERNAL_TABLE_ROWS()
INTENRAL_UPDATE_TIME()
INTERNAL() -- Return the index of the argument that is less than the first argument
IS
IS_FREE_LOCK()
IS_NOT
IS_NOT_NULL
IS_NULL
IS_USED_LOCK()
IS_UUID()
ISNULL()
JSON_ARRAY()
JSON_ARRAY_APPEND()
JSON_ARRAY_INSERT()
JSON_ARRAYAGG() -- Return result set as a single JSON array
JSON_CONTAINS() -- Whether JSON document contains specific object at path
JSON_CONTAINS_PATH() -- Whether JSON document contains any data at path
JSON_DEPTH() -- Maximum depth of JSON document
JSON_EXTRACT()
JSON_INSERT()
JSON_KEYS()
JSON_LENGTH()
JSON_MERGE()
JSON_MERGE_PATH()
JSON_MERGE_PRESERVE()
JSON_OBJECT()
JSON_OBJECTAGG()
JSON_OVERLAPS()
JSON_PRETTY()
JSON_QUOTE()
JSON_REMOVE()
JSON_REPLACE()
JSON_SCHEMA_VALID()
JSON_SCHEMA_VLIADATION_REPORT()
JSON_SERACH()
JSON_SET()
JSON_STORAGE_FREE()
JSON_STORAGE_SIZE()
JSON_TABLE()
JSON_TYPE()
JSON_UNQUOTE()
JSON_VALID()
LAG()
LAST_DAY
LAST_INDEST_ID()
LAST_VALUE()
LCASE() -- Synonym for LOWER()
LEAD() -- Value of argument from row leading current row within partition
LEAST()
LEFT()
LENGTH()
LIKE
LineString()
LN()
LOAD_FILE()
LOCALTIME(), LOCALTIME
LOCALTIMESTAMP, LOCALTIMESTAMP()
LOCATE()
LOG()
LOG10()
LOG2()
LOWER()
LPAD() -- Return the string argument, left-padded with the specified string
LTRIM() -- Remove leading spaces
MAKE_SET()
MAKEDATE()
MAKETIME()
MASTER_POS_WAIT() -- Block until the replica has read and applied all updates up to the specified position
MATCH() 
MAX()
MBRContains() -- Whether MBR of one geometry contains MBR of another
MBRCoveredBy() -- Whether one MBR is ocovered by another -- Minimum Bounding Rectangles
MBRCovers()
MBRDisjoint()
MBREquals()
MBRIntersects()
MBROverlaps()
MBRTouches()
MBRWithin()
MB5() -- Calculate the MBR5 checksum. A checksum is aadigit representing the sum of the correct digits in a piece of stored or transmitted digital data, against which later comparisons can be made to detect errors in the data
MEMBER_OF()
MICROSECOND()
MID() -- Return a substring starting from the specified position
MIN()
MINUTE()
MOD()
MONTH()
MONTHNAME()
MultiLineString()
MultiPoint()
MultiPolygon()
NAME_CONST() -- Causes the column to have the given name
NOT, !
NOT BETWEEN ... AND ... -- Whether avalue is not within a range of values
NOT_EXISTS() -- Whether the result of a query contains no rows
NOT_IN()
NOT_LIKE
NOT_REGEXP -- Negation of REGEXP
NOW()
NTH_VALUE() -- Value of argument from the N-th row of window frame
NTILE() -- Bucket number of current row within its partition.
NULLIF() -- Return NULL if expr1 = expr2
OCT() -- A string containing octal representaion of a number
OCTET_LENGTH() -- Synonym for LENGTH(0
OR, ||
ORD -- Return character code for leftmost character of the argument
PERCENT_RANK()
PERIOD_ADD()
PERIOD_DIFF()
PI()
Point() -- Construct Point from coordinates
Polygon() -- Construct a Polygon from coordinates
POSITION() -- Synonym for LOCATE()
POW()
POWER()
PS_CURRENT_THREAD_ID()
PS_THREAD_ID()
QUARTER() -- Return the quarter from a date argument
QUOTE()
RADIANS()
RAND() -- Return a random floating-point value
RANDOM_BYTES() -- Return a random bytes vector
RANK()
REGEXP -- Whether string matches regular expression
REGEXP_INSTR()
REGEXP_LIKE()
REGEXP_REPLACE()
RELEASE_ALL_LOCKS()
RELEASE_LOCK()
REPEAT() -- Repeat a string the spoecified number of times
REVERSE()
RIGHT() -- Return the specified rightmost number of characters
RLIKE()
ROLES_GRAPHML() -- Return a GraphML document representing memory role subgraphs
ROUND()
ROW_COUNT()
ROW_NUMBER()
RPAD()
RTRIM()
SCHEMA()
SEC_TO_TIME()
SECOND()
SESSION_USER()
SHA1(), SHA() -- Calculate an SHA-1 160-bit checksum
SHA2() -- Calculate an SHA-2 checksum
SIGN()
SIN()
SLEEP()
SOUNDEX() -- Return a soundex string
SOUNDS_LIKE() -- Compare sounds
SOURCE_POS_WAIT()
SPACE()
SQRT()
ST_Area() -- Return Polygon or MultiPolygon area
ST_AsBinary(), ST_AsWKB() -- Convert from internal geometry format to WKB
ST_AsGeoJSON()
ST_AsText(), ST_AsWKT()
ST_Buffer() -- Return geometry of points within given distance from geometry
ST_Buffer_Strategy()
ST_Centroid
ST_Collect()
ST_Contains()
ST_ConvexHull() -- Return convex hull of geometry
ST_Crosses()
ST_Difference() -- Return point set difference of two geometries
ST_Dimension()
ST_Disjoint()
ST_Distance()
ST_Distance_Sphere()
ST_EndPoint()
ST_Envelope()
ST_Equals()
ST_ExteriorRing() -- Return exterior ring of Polygon
ST_FrechetDistance()
ST_GeoHash()
ST_GeomCollFromText(), ST_GeometryCollectionFromText(), ST_GeomCollFromTxt() -- Return geometry collection from WKT
ST_GeomCollFromWKB(), ST_GeometryFollectionFromWKB() -- Return geometry collection from WKB
ST_GeometryN() -- Return N-th geometry from geometry collection
ST_GeometryType()
ST_GeomFromGeoJSON() 
ST_GeomFromText(), ST_GeometryFromText()
ST_GeomFromWKB(), ST_GeometryFromWKB()
ST_HausdorfDistance() 
ST_InteriorRingN()

