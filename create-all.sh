rm fake-*.json

touch fake-product-qn.json
touch fake-product-fta.json
touch fake-product-snrf.json
touch fake-customer-qn.json
touch fake-customer-fta.json
touch fake-customer-snrf.json
touch fake-order-qn.json
touch fake-order-fta.json
touch fake-order-snrf.json

node beesearch/fake-product.js qn 10
node beesearch/fake-product.js fta 10
node beesearch/fake-product.js snrf 10
node beesearch/fake-customer.js qn 10
node beesearch/fake-customer.js fta 10
node beesearch/fake-customer.js snrf 10
node beesearch/fake-order.js qn 10
node beesearch/fake-order.js fta 10
node beesearch/fake-order.js snrf 10

wc -l fake-product-qn.json
wc -l fake-product-fta.json
wc -l fake-product-snrf.json
wc -l fake-customer-qn.json
wc -l fake-customer-fta.json
wc -l fake-customer-snrf.json
wc -l fake-order-qn.json
wc -l fake-order-fta.json
wc -l fake-order-snrf.json


echo "Envoyer vers Elasticsearch ? [y/n]"

read touche

case $touche in
	y)
		echo "Send log to elasticsearch"
		sudo cat fake-product-qn.json | nc localhost 3401
		sudo cat fake-product-fta.json | nc localhost 3402
		sudo cat fake-product-snrf.json | nc localhost 3403
		sudo cat fake-customer-qn.json | nc localhost 3404
		sudo cat fake-customer-fta.json | nc localhost 3405
		sudo cat fake-customer-snrf.json | nc localhost 3406
		sudo cat fake-order-qn.json | nc localhost 3407
		sudo cat fake-order-fta.json | nc localhost 3408
		sudo cat fake-order-snrf.json | nc localhost 3409
		;;
	n)
		echo "Bye"
		;;
esac	
