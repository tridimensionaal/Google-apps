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

devs_group = group raw by (developer_id, free);

devs_group_count = foreach devs_group generate group, COUNT($1) as count;

split devs_group_count into devs_free if $0.free==TRUE, devs_paid if $0.free==FALSE;

devs_free_desc = order devs_free by count desc;

devs_paid_desc = order devs_paid by count desc;

STORE devs_free_desc INTO 'devs_free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();

STORE devs_paid_desc INTO 'devs_paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();