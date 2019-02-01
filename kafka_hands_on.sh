# Include Kafka binaries in the path
export PATH=$PATH:/usr/hdp/current/kafka-broker/bin

# Create the topic
# Replace localhost with the hostname of node where zookeeper server is running.
# Replace test with your topic name
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

# Check if topic is created
kafka-topics.sh  --list --zookeeper localhost:2181

# Produce 
# find the ip address of any broker from zookeeper-client using command get /brokers/ids/0
# test is a topicname here. Replace test with some name specific to your username like abhinav9884_test
# Replace localhost with the hostname of broker
# Replace test with your topic name

kafka-console-producer.sh --broker-list localhost:6667 --topic test

# Push messages to topic, type "my first kafka topic"

# Test if producer is working by consuming messages in another terminal
# Replace test with your topic name
kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning

# Produce a lot
# Replace localhost with the hostname of broker
yes | kafka-console-producer.sh --broker-list localhost:6667 --topic test 
