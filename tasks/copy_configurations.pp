./tasks/copy_configurations.yml

name: copy conf file default.conf
template: src=templates/etc/nginx/conf.d/default.conf dest=/etc/nginx/conf.d/default.conf owner=root mode=0644

name: copy conf file nginx.conf
template: src=templates/etc/nginx/nginx.conf dest=/etc/nginx/nginx.conf owner=root mode=0644

name: copy certs
template: src=templates/etc/nginx/ssl/test.io-cert.pem dest=/etc/nginx/ssl/test.io-cert.pem
template: src=templates/etc/nginx/ssl/test.io-key.pem dest=/etc/nginx/ssl/test.io-key.pem

name: reload nginx
service:
	name: nginx
	state: restarted

