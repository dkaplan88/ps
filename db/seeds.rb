# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Tag.destroy_all

p1 = Post.create!(title: 'Example Title', content: '<b>Test</b>')
p2 = Post.create!(title: 'Example Title2', content: '<a href="http://www.grantland.com">link text</a>')
p3= Post.create!(title: 'Example Title3', content: '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse bibendum id mauris vel ullamcorper. Integer eget ligula vehicula, volutpat lacus vel, gravida massa. Aenean convallis, eros ac venenatis porta, ex metus imperdiet neque, sit amet iaculis sapien massa in mi. Proin id enim commodo, ultricies lacus in, faucibus diam. Nulla pharetra tortor nec leo consectetur, eget laoreet felis placerat. Etiam ultrices, nunc quis pharetra laoreet, sapien leo vehicula magna, a gravida ante velit eu nisi. Quisque pulvinar, ipsum quis imperdiet varius, erat enim suscipit arcu, in laoreet nisl sem nec lectus. Donec consectetur et nibh sit amet tristique.</p><p>Vivamus a sollicitudin nisl. Sed imperdiet neque sit amet lorem ultricies, quis laoreet nibh porttitor. Integer condimentum leo eu odio aliquet, id luctus arcu blandit. Fusce ut leo non ipsum accumsan finibus. Quisque semper pretium ligula. Aenean quis est lobortis, iaculis elit condimentum, mattis sapien. Etiam mollis tellus eu hendrerit fermentum. Quisque dictum dui et viverra vulputate. Suspendisse aliquet ac odio vel ornare. Quisque leo purus, blandit sed libero et, euismod ullamcorper metus. Nullam mauris mauris, consequat eu purus id, pretium porttitor lacus. Quisque efficitur, mauris sed varius scelerisque, nisi sem vulputate eros, eget imperdiet purus massa eget sem. Pellentesque tincidunt quis odio vitae sollicitudin. Cras finibus viverra magna, in suscipit est lacinia nec.</p>
<p>Pellentesque sodales maximus elementum. Phasellus urna massa, sodales vehicula nulla ac, dapibus aliquam tellus. Morbi finibus auctor libero, id lobortis nisi. Cras egestas volutpat ante eu elementum. Suspendisse elementum, turpis in commodo viverra, ipsum lorem aliquam augue, sed efficitur nisl mi ac quam. Integer rhoncus ultrices neque. Aliquam porta diam vitae orci faucibus sagittis. Aenean eleifend erat sit amet augue volutpat tincidunt. Nullam tristique ullamcorper mauris et dignissim. Proin porttitor posuere rutrum. Aliquam tincidunt lacus lorem, vitae volutpat neque elementum vel. Suspendisse lacinia pharetra mi nec finibus. Curabitur consequat nisi vel diam finibus tincidunt.</p>
<p>Praesent non auctor augue. Sed ut est id sapien facilisis malesuada. Donec dapibus vel nibh id tincidunt. Fusce pellentesque est et volutpat dictum. Sed elementum tempus convallis. Sed pharetra lobortis arcu, a commodo ipsum pharetra sit amet. Morbi semper diam sed semper pulvinar. Aenean in posuere enim, et vehicula diam. Aliquam nec varius metus, nec congue sapien. Praesent mauris erat, commodo vitae finibus sit amet, cursus ac lorem. Vestibulum mollis ligula in velit euismod, ac vestibulum sem tincidunt.</p>
<pNulla ultrices lectus nunc, sed tempor risus porta eu. Maecenas ante metus, congue non nibh bibendum, semper lacinia lorem. Curabitur volutpat condimentum faucibus. Cras ultricies rhoncus ipsum. Pellentesque et auctor erat, sed tempor neque. Mauris tempor varius convallis. Nullam sit amet sem lorem. Sed nisi purus, varius at leo nec, imperdiet tristique magna. Nullam cursus quam metus, at congue est sodales ut. In suscipit libero eu luctus feugiat. Proin sapien nisi, ornare in libero at, sagittis convallis tortor.</p>')

t1 = Tag.create!(name: 'hi', slug: 'hi')
t2 = Tag.create!(name: 'poop', slug: 'poop')
t3 = Tag.create!(name: 'party', slug: 'party')

p1.tags = [t1, t2]
p1.save

p2.tags = [t3]
p2.save