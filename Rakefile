desc 'Publish article to blog'
task :publish do
  %x{ 
    cd /home/kmcd/src/blog &&
    git add . && 
    git commit -m 'Publishing article' &&
    git push heroku master &&
    git push github master
  }
end