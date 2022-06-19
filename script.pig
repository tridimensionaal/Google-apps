-- read file
raw = LOAD 'dataset/Google-Playstore.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage() AS (
    app_name:chararray, 
    app_id:chararray,
	category:chararray,
	rating:double,
	rating_count:int,
	installs:chararray,
	minimum_installs:chararray,
	maximum_installs:chararray,
	free:boolean,
	price:double,
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
	ad_supported:boolean,
	in_app_purchases:boolean,
	editors_choice:chararray,
	scraped_time:chararray
    );

-- remover header 
raw_no_header = FILTER raw BY app_name != 'App Name';

-- 
raw_count = FILTER raw_no_header BY rating_count >= 10000 AND rating > 4.4;

-- select important fieds
fields_apps = FOREACH raw_count GENERATE 
    category, 
    (
        CASE
            WHEN rating > 4.4 AND rating <= 4.6 THEN '(4.4, 4.6]'
            WHEN rating > 4.6 AND rating <= 4.8 THEN '(4.6, 4.8]'
            ELSE '(4.8, 5.0]'
        END
    ) AS rating, 
    (
        CASE 
            WHEN free == TRUE THEN 'Free'
            ELSE 'No free'
        END
    ) AS free,
    (
        CASE 
            WHEN ad_supported == TRUE THEN 'Ad supported'
            ELSE 'No ad supported'
        END
    ) AS ad_supported,
    (
        CASE 
            WHEN in_app_purchases == TRUE THEN 'In app purchases'
            ELSE 'No in app purchases'
        END
    ) AS in_app_purchases;

-- group apps by fields
apps_group = GROUP fields_apps BY (category, rating, free, ad_supported, in_app_purchases);

-- count groups 
apps_group_count = FOREACH apps_group GENERATE group, COUNT($1) AS count;

-- order 
apps_group_count_desc = ORDER apps_group_count BY count DESC;

-- save data
STORE apps_group_count_desc INTO 'apps_group.txt' USING org.apache.pig.piggybank.storage.CSVExcelStorage();

