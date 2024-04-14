select * from portfolio_project.coviddeaths order by 3,4;

select * from portfolio_project.covidvaccinations order by 3,4;

select location,total_deaths, total_cases, (total_deaths/total_cases)*100 as Death_percentage 
from portfolio_project.coviddeaths 
where location like "A%"
order by Death_percentage desc;

-- Infection rate

select location , sum(total_cases) , sum(population) , (sum(total_cases)/sum(population))*100 as Infection_per 
from portfolio_project.coviddeaths
group by location
order by Infection_per desc;

-- total death count--
select location, sum(total_deaths) as total_deaths, sum(population)
from portfolio_project.coviddeaths
group by location;



-- Joining the two tables together
select * from portfolio_project.coviddeaths as death
join  portfolio_project.covidvaccinations as vac
on death.location = vac.location;

use portfolio_project;
create temporary table New_table 
(select death.date, death.location, death.total_cases, death.population from portfolio_project.coviddeaths as death
join  portfolio_project.covidvaccinations as vac
on death.location = vac.location);

select * from New_table;

create view Date as
select date from portfolio_project.coviddeaths;

select * from Date;

drop view if exists Date;

select count(distinct location) from portfolio_project.coviddeaths;
