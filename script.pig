-- Script to know the best app free with no ads by category. 

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

-- filter apps with good califications
raw_good_apps = FILTER raw_no_header BY rating_count >= 10000 AND rating > 4.5;

-- filter apps that are free with no ads.
raw_free_no_ads = FILTER raw_good_apps BY free == TRUE AND ad_supported == FALSE; 

-- group apps by category
apps_category_group = GROUP raw_free_no_ads BY category;

-- count groups 
apps_group_count = FOREACH apps_category_group GENERATE group, COUNT($1) AS count;

-- get the best app foreach category
best_for_category = FOREACH (GROUP raw_free_no_ads BY category) {
   ordered = ORDER raw_free_no_ads BY rating DESC; 
   limited = LIMIT ordered 1; 
   GENERATE flatten(limited);
};

-- join
category_best = JOIN best_for_category BY category, apps_group_count BY group;

-- select just what we want
category_best_cleaned = FOREACH category_best GENERATE group, count, app_name, rating;

-- order 
apps_group_count_desc = ORDER category_best_cleaned BY count DESC;

-- save data
STORE apps_group_count_desc INTO 'free_noAd_AppGroup' USING org.apache.pig.piggybank.storage.CSVExcelStorage();