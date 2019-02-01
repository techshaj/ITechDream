# Clone CloudxLab BigData repository

git clone https://github.com/cloudxlab/bigdata.git

# If already cloned then update the repository

cd ~/bigdata && git pull origin master

# Code is inside spark/examples/streaming/word_count_kafka

# Build the sbt project

cd spark/examples/streaming/word_count_kafka
sbt clean && sbt package

# Run the Spark streaming code
# Use new topic
# Replace test1 with your new topic name

spark-submit --class "KafkaWordCount" --jars spark-streaming-kafka-assembly_2.10-1.5.2.jar target/scala-2.10/kafkawordcount_2.10-0.1-SNAPSHOT.jar localhost:2181 spark-streaming-consumer-group test1 2>/dev/null

# Login to web console on the new tab
# Include Kafka binaries in the path
export PATH=$PATH:/usr/hdp/current/kafka-broker/bin

# Create a new topic test1
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test1

# Produce a lot
# Replace localhost with the hostname of broker and test1 with your topic name
yes | kafka-console-producer.sh --broker-list localhost:6667 --topic test1