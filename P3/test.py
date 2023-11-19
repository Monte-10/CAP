APP_NAME = "AppSpark"
SPARK_URL = "http://10.244.0.119:30080"
IP = "10.244.0.119"
spark = SparkSession.builder.appName(APP_NAME).master(SPARK_URL)\
.config("spark.driver.host", IP) \
.getOrCreate()

sc = spark.sparkContext

data= ["Esto","es","una","prueba"]

rdd = sc.parallelize(data)
rdd2 = rdd.map(lambda x: (x,1))
for element in rdd2.collect():
    print(element)