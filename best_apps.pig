-- read file
raw = LOAD 'dataset/Google-Playstore.csv' USING PigStorage(',') AS (
    app_name:chararray, 
    app_id:chararray,
	category:chararray,
	rating:float,
	rating_count:int,
	installs:chararray,
	minimum_installs:chararray,
	maximum_installs:chararray,
	free:chararray,
	price:float,
	currency:chararray,
	size:chararray,
	minimum_android:chararray,
	developer_id:chararray,
	developer_website:chararray,
	developer_email:chararray,
	released:chararray,
	last_updated:chararray,
	content_rating:chararray,
	privacy_policy:chararray,
	ad_supported:chararray,
	in_app_purchases:chararray,
	editors_choice:chararray,
	scraped_time:chararray
    );

-- remover header 
raw_no_header = FILTER raw BY app_name != 'App Name';

-- 
raw_count = FILTER raw_no_header BY rating_count >= 10000;

-- select important fieds
fields_apps = FOREACH raw_count GENERATE 
    category, 
    (
        CASE
            WHEN rating > 3.8 AND rating <= 4.0 THEN '(3.8, 4.0]'
            WHEN rating > 4.0 AND rating <= 4.2 THEN '(4.0, 4.2]'
            WHEN rating > 4.2 AND rating <= 4.4 THEN '(4.2, 4.4]'
            WHEN rating > 4.4 AND rating <= 4.6 THEN '(4.4, 4.6]'
            ELSE '(4.6, 5.0]'
        END
    ) AS rating, 
    (
        CASE 
            WHEN price == 0.0 THEN 'Free'
            WHEN price > 0.0 AND price <= 2.0 THEN '(0, 2] USD'
            WHEN price > 2.0 AND price <= 4.0 THEN '(2, 4] USD'
            WHEN price > 4.0 AND price <= 6.0 THEN '(4, 6] USD'
            WHEN price > 6.0 AND price <= 8.0 THEN '(6, 8] USD'
            ELSE '(8, inf] USD'
        END
    ) AS price;

-- group apps by fields
apps_group = GROUP fields_apps BY (category, rating, price);

-- count groups 
apps_group_count = FOREACH apps_group GENERATE group, COUNT($1) AS count;

-- order 
apps_group_count_desc = ORDER apps_group_count BY count DESC;

-- save data
STORE apps_group_count_desc INTO 'apps_group' USING PigStorage(',');

