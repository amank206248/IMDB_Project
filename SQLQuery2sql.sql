use IMDB
select *from earning
select *from genre
select *from imdb

 
--Table 1: Domestic Collection				

--What is the total domestic collection for all movies?--
select e.movie_id,i.title,sum(e.domestic) as total_domestic_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title 
 
 --Which movie had the highest domestic collection?
 select top 1  e.movie_id,i.title,sum(e.domestic) as total_domestic_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by total_domestic_collection desc;

--What is the average domestic collection for movies?
select e.movie_id,i.title,avg(e.domestic) as Average_domestic_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title

--Can you list the top 5 movies with the highest domestic collections?
select top 5  e.movie_id,i.title,sum(e.domestic) as total_domestic_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by total_domestic_collection desc;

--How many movies in the table have a domestic collection above 100 million?								
select e.movie_id,i.title,sum(e.domestic) as total_domestic_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id  group by  e.movie_id,i.title having  sum(e.domestic) > 1000000000 ;

--Which genre tends to perform best in terms of domestic collection?								
select g.genre,count(g.genre) total_genre,sum(e.domestic) total_collection from genre as g inner join earning as e on g.movie_id=e.movie_id
 where g.genre!= ' '  group by g.genre order by total_collection desc  ;

--Table 2: Worldwide Collection				

--What is the total worldwide collection for all movies?						
select e.movie_id,i.title,sum(e.worldwide) as total_worldwide_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by total_worldwide_collection desc
 
 
--Which movie had the highest worldwide collection?						
select top 1 e.movie_id,i.title,sum(e.worldwide) as total_worldwide_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by total_worldwide_collection desc
 

--What is the average worldwide collection for movies?						
select   e.movie_id,i.title,avg(e.worldwide) as average_worldwide_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by average_worldwide_collection desc
 
--Can you list the top 5 movies with the highest worldwide collections?								
select top 5 e.movie_id,i.title,sum(e.worldwide) as total_worldwide_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id group by e.movie_id,i.title order by total_worldwide_collection desc

--How many movies in the table have a worldwide collection above 50000000?	 							
select e.movie_id,i.title,sum(e.worldwide) as total_world_collection from earning as e inner join imdb as i
on e.Movie_id=i.Movie_id  group by  e.movie_id,i.title having  sum(e.worldwide) > 50000000	 ;

--Which genre tends to perform best in terms of worldwide collection?									
select g.genre,count(g.genre) total_genre,sum(e.worldwide) total_worldwide_collection from genre as g inner join earning as e on g.movie_id=e.movie_id
 where g.genre!= ' '  group by g.genre order by total_worldwide_collection desc  ;

 --Table 3: Movie Details			
--What is the highest-rated movie in the dataset?						
select i.movie_id,i.title,sum(i.rating) total_rating from imdb as i group by i.movie_id,i.title  order by total_rating desc

--How many movies have a rating above 8.0?					
 
select count(i.movie_id) total_movies,i.rating  from imdb as i  group by i.rating  
having (i.rating) >8 