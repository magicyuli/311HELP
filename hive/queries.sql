# agencies percentage
SELECT Agency,COUNT(*)/cnt.total AS percentage
FROM complaints, (SELECT COUNT(*) AS total FROM complaints) AS cnt
GROUP BY Agency,cnt.total
ORDER BY percentage DESC;

# agency count
SELECT Agency, AgencyName, COUNT(*) AS cnt
FROM complaints
GROUP BY Agency, AgencyName
ORDER BY cnt DESC;

# complaint types percentage
SELECT ComplaintType, COUNT(*)/10540651 AS percentage
FROM complaints
GROUP BY ComplaintType
ORDER BY percentage DESC;

# daily comp
SELECT SUBSTRING(CreatedDate, 0, 10) AS dat, COUNT(*) AS cnt
FROM complaints
GROUP BY SUBSTRING(CreatedDate, 0, 10)
ORDER BY dat;

# zipcode comp
SELECT IncidentZip, COUNT(*) AS cnt
FROM complaints
GROUP BY IncidentZip
ORDER BY cnt DESC;

# agency complaint type
SELECT Agency, ComplaintType, COUNT(*) AS cnt
FROM complaints
GROUP BY Agency, ComplaintType
ORDER BY Agency ASC, cnt DESC;

# comp type date
SELECT ComplaintType, SUBSTRING(CreatedDate, 0, 10) AS dat, COUNT(*) AS cnt
FROM complaints
GROUP BY ComplaintType, SUBSTRING(CreatedDate, 0, 10);


