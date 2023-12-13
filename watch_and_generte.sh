printf "iiwaData.rb\niiwa.rb\niiwa.xml.erb\nlink.rb\n" | entr sh -c 'erb iiwa.xml.erb > iiwa.xml 2>&1 && xmllint --format iiwa.xml > tmp.xml && mv tmp.xml iiwa.xml'

