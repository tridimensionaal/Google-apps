# base image
FROM stfnltnr/hadoop:3.2.0
# pig version
ARG PIG_VERSION=0.17.0 
# env vars
ENV PIG_HOME=/opt/pig \
    PIG_CLASSPATH=$HADOOP_CONF_DIR
# install
RUN apt-get update && \
    apt-get install -y python && \
    apt-get clean && \
    wget http://mirror.klaus-uwe.me/apache/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz && \
    tar -xzf pig-$PIG_VERSION.tar.gz && \
    mv pig-$PIG_VERSION $PIG_HOME && \
    echo "PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$PIG_HOME/bin:$PATH" >> ~/.bashrc && \
    rm -rf pig-$PIG_VERSION.tar.gz /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./dataset/Google-Playstore.csv /proyecto/dataset/Google-Playstore.csv
COPY ./best_apps.pig /proyecto/best_apps.pig
COPY ./developers.pig /proyecto/developers.pig
