//
//  Constante.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit



var dataBase:[String:String] = ["Max.ravau@gmail.com" : "Maxmax"]

var myPlaylist: [Movie] = []



// On a crée la fonction removeMoviePlaylist avec un paramètre INT
func RemoveMoviePlaylist(identifiant:Int){
// on crée une variable counter est on l'a déclare à 0
    var counter : Int = 0
// On fait notre boucle de notre liste
    while counter < myPlaylist.count{
        
        print(" ex : \(counter)")
// on crée une condition si l'identifiant du film de la liste et pareil que le l'identifiant du film
        if myPlaylist[counter]._identifiant == identifiant{
            
            print("\(counter)")
            print("\(myPlaylist)")
            
// alors on supprime le counter selectionné.
          
         myPlaylist.remove(at: counter)
            
        }
       counter += 1 
    }
    
}

func thisMovieIsInPlaylist(film: Movie) -> Bool{
    
    var counter : Int = 0
    
    while counter < myPlaylist.count{
        
        if myPlaylist[counter]._identifiant == film._identifiant{
            
            
                return true
        
        }else{
        
            
        }
        counter += 1
    }
    return false
}



// On a crée une liste de Catégorie qui contient chacune une liste de film, qu'on pourra récupérer dans Discover
    var listeCategorie : [Categorie] = [
        Categorie(titre: "VICTORY", sousTitre: "Inspirational sports stories about overcoming all odds" , imageCover: #imageLiteral(resourceName: "Boxe"), listeMovie: [
            Movie(titre: "WARRIOR", sousTitre: "An ex-Marine haunted by a tragic past, Tommy Riordan (Tom Hardy) returns to his hometown of Pittsburgh and enlists his father (Nick Nolte), a recovering alcoholic and his former coach, to train him for an MMA tournament awarding the biggest purse in the history of the sport. As Tommy blazes a violent path toward the title prize, his brother Brendan (Joel Edgerton), a former MMA fighter unable to make ends meet as a public school teacher, returns to the amateur ring to provide for his family. Even though years have passed, recriminations and past betrayals keep Brendan bitterly estranged from both Tommy and his father. But when Brendan's unlikely rise as an underdog sets him on a collision course with Tommy, the two brothers must finally confront the forces that tore them apart, all the while waging the most intense winner-take-all battle of their lives.", image: #imageLiteral(resourceName: "Warrior_Poster"), duree: "140 minutes", annee: "2011", identifiant: 1),
            Movie(titre: "RUDY", sousTitre: "Rudy grew up in a steel mill town where most people ended up working, but wanted to play football at Notre Dame instead. There were only a couple of problems. His grades were a little low, his athletic skills were poor, and he was only half the size of the other players. But he had the drive and the spirit of 5 people and has set his sights upon joining the team.", image: #imageLiteral(resourceName: "Rudy"), duree: "114 minutes", annee: "1993",identifiant: 2),
            Movie(titre: "MIRACLE", sousTitre: "In 1980, the United States Ice Hockey team's coach, Herb Brooks, put a ragtag squad of college kids up against the legendary juggernaut from the Soviet Union at the Olympic Games. Despite the long odds, Team USA carried the pride of a nation yearning for a distraction from world events. With the world watching, the team rose to the occasion, prompting broadcaster Al Michaels' now famous question to the millions viewing at home: Do you believe in miracles? Yes!", image: #imageLiteral(resourceName: "Miracle") , duree: "135 minutes", annee: "2004", identifiant: 3),
            Movie(titre: "VICTORY", sousTitre: "A group of POWs in a German prison camp during World War II play the German National Soccer Team in this powerful film depicting the role of prisoners during wartime.",image: #imageLiteral(resourceName: "Victory"), duree: "116 minutes", annee: "1981",identifiant: 4)]
            
            
        ),
        Categorie(titre: "SUMMERFOOD", sousTitre: "Burgers, beer, wine,and more" , imageCover: #imageLiteral(resourceName: "Hamburger"), listeMovie: [
            Movie(titre: "CLOUDY WITH A CHANCE OF MEATBALLS", sousTitre: "Inventor Flint Lockwood creates a machine that makes clouds rain food, enabling the down-and-out citizens of Chewandswallow to feed themselves. But when the falling food reaches gargantuan proportions, Flint must scramble to avert disaster. Can he regain control of the machine and put an end to the wild weather before the town is destroyed?", image: #imageLiteral(resourceName: "Cloudy_with_a_Chance_of_Meatballs"), duree: "90 minutes", annee: "2009",identifiant: 5),
            Movie(titre: "GOOD BURGER", sousTitre: "School is out and Dexter Reed's plans for summer vacation is ruined after getting into a car accident with his teacher. To pay off his teacher's car, Dexter is forced to get a summer job at a fast food restaurant. While working at his summer job, Dexter meets a new friend Ed and the restaurant competes with a giant fast food chain across the street.", image: #imageLiteral(resourceName: "GoodBurger"), duree: "103 minutes", annee: "1997",identifiant: 6),
            Movie(titre: "CHEF", sousTitre: "A chef who loses his restaurant job starts up a food truck in an effort to reclaim his creative promise, while piecing back together his estranged family.", image: #imageLiteral(resourceName: "CHEF"), duree: "115 minutes", annee: "2014", identifiant: 7),
            Movie(titre: "FRIED GREEN TOMATOES", sousTitre: "Amidst her own personality crisis, southern housewife Evelyn Couch meets Ninny, an outgoing old woman who tells her the story of Idgie Threadgoode and Ruth Jamison, two young women who experienced hardships and love in Whistle Stop, Alabama in the 1920s.", image: #imageLiteral(resourceName: "fried-green-tomatoes-1"), duree: "130 minutes", annee: "1991",identifiant: 8)]
            
        ),
        
        Categorie(titre: "DANG IT'S HOT OUT THERE", sousTitre: "Deal with the heat by staying in a watching a movie"  , imageCover: #imageLiteral(resourceName: "hero_do-the-right-thing-DI"), listeMovie: [
            Movie(titre: "DOG DAY AFTERNOON", sousTitre: "A man robs a bank to pay for his lover's operation; it turns into a hostage situation and a media circus.", image: #imageLiteral(resourceName: "DOG DAY AFTERNOON"), duree: "125 minutes", annee: "1975",identifiant: 9),
            Movie(titre: "LAWRENCE OF ARABIA", sousTitre: "An epic about British officer T.E. Lawrence's mission to aid the Arab tribes in their revolt against the Ottoman Empire during the First World War. Lawrence becomes a flamboyant, messianic figure in the cause of Arab unity but his psychological instability threatens to undermine his achievements.", image: #imageLiteral(resourceName: "LawrenceofArabia"), duree: "216 minutes", annee: "1962", identifiant: 10),
            Movie(titre: "12 ANGRY MEN", sousTitre: "The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors' prejudices and preconceptions about the trial, the accused, and each other.", image: #imageLiteral(resourceName: "12_angry_men_bd"), duree: "96 minutes", annee: "1957", identifiant: 11),
            Movie(titre: "SUMMER OF SAM", sousTitre: "Spike Lee's take on the son of Sam, murders in New York City during the summer of 1977 centering on the residents of an Italian-American South Bronx neighborhood who live in fear and distrust of one another.", image: #imageLiteral(resourceName: "Summer-of-Sam-2"), duree: "142 minutes", annee: "1999",identifiant: 12)]
            
        ),
        Categorie(titre: "ROAD TRIP", sousTitre: "It's all about the journey", imageCover: #imageLiteral(resourceName: "Road Trip"), listeMovie: [
            Movie(titre: "ROAD TRIP", sousTitre: "Four friends take off on an 1800 mile road trip to retrieve an illicit tape mistakenly mailed to a girl friend.", image: #imageLiteral(resourceName: "Road_Trip_movie"), duree: "93 minutes", annee: "2000",identifiant: 13),
            Movie(titre: "LITTLE MISS SUNSHINE", sousTitre: "A family loaded with quirky, colorful characters piles into an old van and road trips to California for little Olive to compete in a beauty pageant.", image: #imageLiteral(resourceName: "LITTLE MISS SUNSHINE"), duree: "102 minutes", annee: "2006", identifiant: 14),
            Movie(titre: "NATIONAL LAMPOON'S VACATION", sousTitre: "The Griswold family are on a quest. A quest to a Walley World theme park for a family vacation, but things aren't going to go exactly as planned, especially when Clark Griswold is losing all thought towards a mysterious blonde in a red Ferrari.", image: #imageLiteral(resourceName: "NATIONAL LAMPOON'S VACATION"), duree: "98 minutes", annee: "1983", identifiant: 15),
            Movie(titre: "VACATION", sousTitre: "Hoping to bring his family closer together and to recreate his childhood vacation for his own kids, a grown up Rusty Griswold takes his wife and their two sons on a cross-country road trip to the coolest theme park in America, Walley World. Needless to say, things don't go quite as planned.", image: #imageLiteral(resourceName: "VACATION"), duree: "99 minutes", annee: "2015", identifiant: 16)]
            
        ),
        
        Categorie(titre: "BASEBALL", sousTitre: "America's favorite pastime", imageCover: #imageLiteral(resourceName: "Baseball"), listeMovie: [
            Movie(titre: "A LEAGUE OF THEIR OWN", sousTitre: "Small-town sisters Dottie and Kit join an all-female baseball league formed after World War II brings pro baseball to a standstill. When their team hits the road with its drunken coach, the siblings find troubles and triumphs on and off the field.", image: #imageLiteral(resourceName: "A LEAGUE OF THEIR OWN"), duree: "128 minutes", annee: "1992", identifiant: 17),
            Movie(titre: "FIELD OF DREAMS", sousTitre: "Ray Kinsella is an Iowa farmer who hears a mysterious voice telling him to turn his cornfield into a baseball diamond. He does, but the voice's directions don't stop -- even after the spirits of deceased ballplayers turn up to play.", image: #imageLiteral(resourceName: "FIELD OF DREAMS"), duree: "107 minutes", annee: "1989", identifiant: 18),
            Movie(titre: "42", sousTitre: "The powerful story of Jackie Robinson, the legendary baseball player who broke Major League Baseball’s color barrier when he joined the roster of the Brooklyn Dodgers. The film follows the innovative Dodgers’ general manager Branch Rickey, the MLB executive who first signed Robinson to the minors and then helped to bring him up to the show.", image:  #imageLiteral(resourceName: "42_film_poster"), duree: "128 minutes", annee: "2013", identifiant: 19),
            Movie(titre: "61*", sousTitre: "In 1961, Roger Maris and Mickey Mantle played for the New York Yankees. One, Mantle, was universally loved, while the other, Maris, was universally hated. Both men started off with a bang, and both were nearing Babe Ruth's 60 home run record. Which man would reach it?", image: #imageLiteral(resourceName: "movie61") , duree: "129 minutes", annee: "2001", identifiant: 20)]
            
        ),
        
        Categorie(titre: "SUMMER CAMP", sousTitre: "Don't let anyone sign your chechs! Harvey Bushkin, Heavyweights", imageCover: #imageLiteral(resourceName: "Summer Camp"), listeMovie: [
            Movie(titre: "HEAVYWEIGHTS", sousTitre: "Camp Hope is a summer retreat for overweight boys run by a kindly couple who make the campers feel comfortable with their extra pounds. But when tyrannical fitness guru Tony buys the camp, he puts the kids on a cruel regimen that goes too far. Sick of the endless weeks of all work and no play, the kids stage a coup and reclaim their summer of fun.", image: #imageLiteral(resourceName: "HEAVYWEIGHTS"), duree: "100 minutes", annee: "1995", identifiant: 21),
            Movie(titre: "WET HOT AMERICAN SUMMER", sousTitre: "The setting is Camp Firewood, the year 1981. It's the last day before everyone goes back to the real world, but there's still a summer's worth of unfinished business to resolve. At the center of the action is camp director Beth, who struggles to keep order while she falls in love with the local astrophysics professor. He is busy trying to save the camp from a deadly piece of NASA's Skylab which is hurtling toward earth. All that, plus: a dangerous waterfall rescue, love triangles, misfits, cool kids, and talking vegetable cans. The questions will all be resolved, of course, at the big talent show at the end of the day.", image: #imageLiteral(resourceName: "Wet_hot_american_summer"), duree: "97 minutes", annee: "2001", identifiant: 22),
            Movie(titre: "CAMP NOWHERE", sousTitre: "Morris Mud Himmel has a problem. His parents desperately want to send him away to summer camp. He hates going to summer camp, and would do anything to get out of it. Talking to his friends, he realizes that they are all facing the same sentence: a boring summer camp. Together with his friends, he hatches a plan to trick all the parents into sending them to a camp of their own design.", image: #imageLiteral(resourceName: "camp-nowhere-movie-poster-1995-1020249087"), duree: "96 minutes", annee: "1994", identifiant: 23),
            Movie(titre: "INDIAN SUMMER", sousTitre: "A group of childhood friends, now in their thirties, reunite at Camp Tamakwa. Only a few of the original campers show up, but they still have a good time reminiscing. The people share experiences and grow while at the camp. They are dismayed to discover that the camp's owner, Unca Lou, is going to close the camp down.", image: #imageLiteral(resourceName: "indiansummer"), duree: "97 minutes", annee: "1993", identifiant: 24)]
            
        ),
        
        Categorie(titre: "SUMMER LOVE", sousTitre: "How long will it last?", imageCover: #imageLiteral(resourceName: "Summer love"), listeMovie: [
            Movie(titre: "(500) DAYS OF SUMMER", sousTitre: "Tom (Joseph Gordon-Levitt), greeting-card writer and hopeless romantic, is caught completely off-guard when his girlfriend, Summer (Zooey Deschanel), suddenly dumps him. He reflects on their 500 days together to try to figure out where their love affair went sour, and in doing so, Tom rediscovers his true passions in life.", image: #imageLiteral(resourceName: "(500) DAYS OF SUMMER"), duree: "95 minutes", annee: "2009", identifiant: 25),
            Movie(titre: "GREASE", sousTitre: "Australian good girl Sandy and greaser Danny fell in love over the summer. But when they unexpectedly discover they're now in the same high school, will they be able to rekindle their romance despite their eccentric friends?", image: #imageLiteral(resourceName: "Grease-1"), duree: "110 minutes", annee: "1978", identifiant: 26),
            Movie(titre: "DEAR JOHN", sousTitre: "Sergeant John Tyree is home on a 2 week leave from Germany. He meets Savannah after he dives into the ocean to retrieve Savannah's purse that had fallen off the pier. John falls in love with Savannah who is a student on spring break helping build a house for Habitat for Humanity. A romance occurs and Savannah falls deeply in love with John. She promises to write John overseas until he returns.", image: #imageLiteral(resourceName: "DEAR JOHN"), duree: "115 minutes", annee: "2010", identifiant: 27),
            Movie(titre: "THE NOTEBOOK", sousTitre: "An epic love story centered around an older man who reads aloud to a woman with Alzheimer's. From a faded notebook, the old man's words bring to life the story about a couple who is separated by World War II, and is then passionately reunited, seven years later, after they have taken different paths.", image: #imageLiteral(resourceName: "THE NOTEBOOK"), duree: "123 minutes", annee: "2004", identifiant: 28)]
            
        ),
        
        Categorie(titre: "MILITARY", sousTitre: "Movies that honor our troops", imageCover: #imageLiteral(resourceName: "Military"), listeMovie: [
            Movie(titre: "SAVING PRIVATE RYAN", sousTitre: "As U.S. troops storm the beaches of Normandy, three brothers lie dead on the battlefield, with a fourth trapped behind enemy lines. Ranger captain John Miller and seven men are tasked with penetrating German-held territory and bringing the boy home.", image: #imageLiteral(resourceName: "SAVING PRIVATE RYAN"), duree: "169 minutes", annee: "1998",identifiant: 29),
            Movie(titre: "THE HURT LOCKER", sousTitre: "Forced to play a dangerous game of cat-and-mouse in the chaos of war, an elite Army bomb squad unit must come together in a city where everyone is a potential enemy and every object could be a deadly bomb.", image: #imageLiteral(resourceName: "THE HURT LOCKER"), duree: "131 minutes", annee: "2008", identifiant: 30),
            Movie(titre: "AMERICAN SNIPER", sousTitre: "U.S. Navy SEAL Chris Kyle takes his sole mission—protect his comrades—to heart and becomes one of the most lethal snipers in American history. His pinpoint accuracy not only saves countless lives but also makes him a prime target of insurgents. Despite grave danger and his struggle to be a good husband and father to his family back in the States, Kyle serves four tours of duty in Iraq. However, when he finally returns home, he finds that he cannot leave the war behind.", image: #imageLiteral(resourceName: "AMERICAN SNIPER"), duree: "134 minutes", annee: "2014", identifiant: 31),
            Movie(titre: "PATTON", sousTitre: "Patton tells the tale of General George S. Patton, famous tank commander of World War II. The film begins with patton's career in North Africa and progresses through the invasion of Germany and the fall of the Third Reich. Side plots also speak of Patton's numerous faults such his temper and habit towards insubordination.", image: #imageLiteral(resourceName: "PATTON"), duree: "172 minutes", annee: "1970", identifiant: 32)]
        
        

        )]
        
        
        
            
            
       
        



