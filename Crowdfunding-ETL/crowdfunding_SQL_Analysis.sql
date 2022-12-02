--- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT cf_id, backers_count
INTO backers_count
FROM campaign
WHERE campaign.outcome = 'live'
ORDER by cf_id DESC;
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT cf_id, COUNT(backer_id) as "backer counts"
INTO 
from backer
group by cf_id
order by cf_id DESC;

-- 3. (5 pts)
-- Set the Remaining Goal Amount
SELECT campaign.goal, 
		campaign.pledged,
		campaign.cf_id, 
		campaign.outcome, 
campaign.goal-campaign.pledged AS "Remaining Goal Amount"
-- INTO remaining_goal_amount
FROM campaign
WHERE campaign.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;

-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT c.first_name,
		c.last_name,
		c.email,
		campaign.goal-campaign.pledged AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as c
INNER JOIN campaign
ON c.contact_id = campaign.contact_id
WHERE campaign.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;
-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT b.email,
		b.first_name,
		b.last_name,
		b.cf_id,
		campaign.company_name,
		campaign.description,
		campaign.end_date,
campaign.goal-campaign.pledged as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backer as b
INNER JOIN campaign
ON b.cf_id = campaign.cf_id
WHERE campaign.outcome = 'live'
ORDER BY b.last_name, b.first_name,b.cf_id  DESC;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount;


