+++
date = "2015-09-24T12:00:00-06:00"
title = "Putting Users in Control of their Recommendations"

+++

([Cross-posted](http://grouplens.org/blog/putting-users-in-control-of-their-recommendations/) from the GroupLens blog)

The music services that I subscribe to don’t understand me very well.
[Pandora](http://www.pandora.com), which puts together personalized radio stations, seems to think that I only like the very most popular music, which I don’t.
[Spotify](http://www.spotify.com), which offers a new personalized playlist for me each week, seems to think that I only like quite obscure music.
But neither of them get it right, and I wish that I could tell them to change.

![screenshots of Pandora and Spotify](/images/pandora-spotify-screenshots.png "Pandora and Spotify are “black box” recommenders, where it is difficult to know how to act to repair bad recommendations.")

I cannot tell these services to change how they recommend music to me because they give me no direct control.
Instead, they give me indirect control: I can listen to songs, skip songs, and provide thumbs up, which in turn changes my recommendations in an unknown fashion.
Because these recommenders are black boxes, I do not know how my actions impact my recommendations.

So how do I fix my bad recommendations?

At the [2015 ACM Conference on Recommender Systems](http://recsys.acm.org/recsys15/), we presented an algorithm and user interface that gives users direct control over a recommender.
Our algorithm works by giving users the ability to express simple preferences (“more popular”, or “less popular”) by pressing a button; these actions immediately change the resulting set of recommendations, which in turn allows the user to decide if the list is getting better or worse.

We deployed a prototype of this system in [MovieLens](http://movielens.org), and learned several things:

* Users reported that their adjusted recommendations were more helpful for finding movies to watch, better fit their preferences, and were more appropriate in terms of popularity, as compared with their original, unadjusted list.
* Different users used the popularity controls very differently. Some wished to preserve the existing MovieLens recommendation behavior. Others wished to completely change the nature of their top recommendations.
* Most users wanted the recommender to become more popular (apparently MovieLens recommends, on average, movies that are too obscure). A minority wished the recommender to become more obscure.

Want the details? Check out the paper.

> F. Maxwell Harper, Funing Xu, Harmanpreet Kaur, Kyle Condiff, Shuo Chang, and Loren Terveen. 2015. Putting Users in Control of Their Recommendations. Proceedings of the 9th ACM Conference on Recommender Systems, ACM, 3–10.

* Direct link to author version: <http://files.grouplens.org/papers/harper-recsys2015.pdf>
* Version of record: <http://dl.acm.org/citation.cfm?id=2800179>
