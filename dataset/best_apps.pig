-- read file
raw = LOAD 'Google-Playstore.csv' USING PigStorage(',') AS (app_name, app_id, category, rating, rating_count, installs, minimum_installs, maximum_nstalls, free, price, currency, size, minimum_android, developer_id, developer_website, developer_email, released, last_updated, content_rating, privacy_policy, ad_supported, in_app_purchases, editors_choice, scraped_time);

-- remover header 
raw_no_header = FILTER raw BY app_name != 'App Name';

-- select important fieds
fields_apps = FOREACH raw_no_header GENERATE category, rating, rating_count, free, price, ad_supported

-- select good apps
good_apps = FILTER fields_apps by rating >= 3.8 AND rating < 4.1 AND rating_count >= 10000;

-- select important fields 
good_apps_fields = FOREACH good_apps GENERATE category, free, price, ad_supported;

-- group apps by fields
good_apps_group = GROUP good_apps_fields BY (category, free, price, ad_supported);

-- count groups 
good_apps_category_count = FOREACH good_apps_group GENERATE group, COUNT($1) AS count;

-- order 
good_apps_category_count_order = ORDER good_apps_fields BY count DESC;

-- save data
STORE good_apps_category_count_order USING PigStorage(',') INTO 'good_apps';





