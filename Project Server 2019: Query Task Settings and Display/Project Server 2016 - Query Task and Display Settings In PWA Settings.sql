-- Author: Mohamed El-Qassas
-- Task settings and Display In Project Server 2016
-- Tracking Method.
SELECT
  CASE WADMIN_DEFAULT_TRACKING_METHOD
    WHEN 1 THEN 'Hours of work done per period'
    WHEN 2 THEN 'Percent Of Work Complete'
    WHEN 3 THEN 'Actual Work Done and Work remaining'
    ELSE 'Free form'
  END AS 'Tracking Method',
  CASE WADMIN_IS_TRACKING_METHOD_LOCKED
    WHEN 0 THEN 'No'
    WHEN 1 THEN 'Yes'
  END AS 'Force the PM to Use the Progress Reporting Method'
FROM pjpub.MSP_WEB_ADMIN

-- Reporting Display
SELECT
  CASE WADMIN_TS_DEF_ENTRY_MODE_ENUM
    WHEN 0 THEN 'Resources should report their hours worked every day'
    WHEN 1 THEN 'Resources should report their total hours worked for a week'
  END AS 'Reporting Display',
  CASE WADMIN_WEEK_STARTS_ON
    WHEN 0 THEN 'Sunday'
    WHEN 1 THEN 'Monday'
    WHEN 2 THEN 'Tuesday'
    WHEN 3 THEN 'Wednsday'
    WHEN 4 THEN 'Thursday'
    WHEN 5 THEN 'Friday'
    WHEN 6 THEN 'Saturday'
  END AS 'Week Start Day'
FROM pjpub.MSP_WEB_ADMIN

-- Protect User Updates
SELECT
  CASE WADMIN_PROTECT_ACTUALS
    WHEN 1 THEN 'Yes'
    ELSE 'No'
  END AS 'Only allow task updates via Tasks and TimeSheet'
FROM pjpub.MSP_WEB_ADMIN

-- Define Near Future Planning Window
SELECT
  WADMIN_STAT_LOOK_AHEAD_PERIODS AS 'Near Future planning Windows'
FROM pjpub.MSP_WEB_ADMIN