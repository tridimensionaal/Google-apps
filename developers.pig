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

devs_group = group raw by (developer_id, free, category);

devs_group_count = foreach devs_group generate group, COUNT($1) as count;

tools_devs = filter devs_group_count by $0.category=='Tools';
education_devs = filter devs_group_count by $0.category=='Education';
social_devs = filter devs_group_count by $0.category=='Social';
communication_devs = filter devs_group_count by $0.category=='Communication';
music_devs = filter devs_group_count by $0.category=='Music & Audio';

split tools_devs into tools_devs_free if $0.free==TRUE, tools_devs_paid if $0.free==FALSE;
split education_devs into edu_devs_free if $0.free==TRUE, edu_devs_paid if $0.free==FALSE;
split social_devs into social_devs_free if $0.free==TRUE, social_devs_paid if $0.free==FALSE;
split communication_devs into com_devs_free if $0.free==TRUE, com_devs_paid if $0.free==FALSE;
split music_devs into music_devs_free if $0.free==TRUE, music_devs_paid if $0.free==FALSE;

tools_devs_free = order tools_devs_free by count desc;
tools_devs_paid = order tools_devs_paid by count desc;
edu_devs_free = order edu_devs_free by count desc;
edu_devs_paid = order edu_devs_paid by count desc;
social_devs_free = order social_devs_free by count desc;
social_devs_paid = order social_devs_paid by count desc;
com_devs_free = order com_devs_free by count desc;
com_devs_paid = order com_devs_paid by count desc;
music_devs_free = order music_devs_free by count desc;
music_devs_paid = order music_devs_paid by count desc;

STORE tools_devs_free INTO 'top_developers/tools/free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE tools_devs_paid INTO 'top_developers/tools/paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE edu_devs_free INTO 'top_developers/education/free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE edu_devs_paid INTO 'top_developers/education/paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE social_devs_free INTO 'top_developers/social/free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE social_devs_paid INTO 'top_developers/social/paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE com_devs_free INTO 'top_developers/communication/free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE com_devs_paid INTO 'top_developers/communication/paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE music_devs_free INTO 'top_developers/music/free' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
STORE music_devs_paid INTO 'top_developers/music/paid' USING org.apache.pig.piggybank.storage.CSVExcelStorage();