//Soccer Coordinator

//Step One: Players in own container
var joeSmith: [Any] = ["Joe Smith", 42.0, true, "Jim & Jan Smith"]
var jillTanner: [Any] = ["Jill Tanner", 36.0, true, "Clara Tanner"]
var billBon: [Any] = ["Bill Bon", 43.0, true, "Sara and Jenny Bon"]
var evaGordon: [Any] = ["Eva Gordon", 45.0, false, "Wendy and Mike Gordon"]
var mattGill: [Any] = ["Matt Gill", 40.0, false, "Charles and Sylvia Gill"]
var kimmyStein: [Any] = ["Kimmy Stein", 41.0, false, "Bill and Hillary Stein"]
var sammyAdams: [Any] = ["Sammy Adams", 45.0, false, "Jeff Adams"]
var karlSaygan: [Any] = ["Karl Saygan", 42.0, true, "Heather Bledsoe"]
var suzaneGreenberg: [Any] = ["Suzane Greenberg", 44.0, true, "Henrietta Dumas"]
var salDali: [Any] = ["Sal Dali", 41.0, false, "Gala Dali"]
var joeKavalier: [Any] = ["Joe Kavalier", 39.0, false, "Sam and Elaine Kavalier"]
var benFinkelstein: [Any] = ["Ben Finkelstein", 44.0, false, "Aaron and Jill Finkelstein"]
var diegoSoto: [Any] = ["Diego Soto", 41.0, true, "Robin and Sarika Soto"]
var choleAlaska: [Any] = ["Chloe Alaska", 47.0, false, "David and Jamie Alaska"]
var arnoldWillis: [Any] = ["Arnold Willis", 43.0, false, "Claire Willis"]
var phillipHelm: [Any] = ["Phillip Helm", 44.0, true, "Thomas Helm and Eva Jones"]
var lesClay: [Any] = ["Les Clay", 42.0, true, "Wynonna Brown"]
var herschelKrustofski: [Any] = ["Herschel Krustofski", 45.0, true, "Hyman and Rachel Krustofski"]

//Step One.1: Array of all players
var players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, choleAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

//Dictonary of teams, used to show team name and training day
var teams: [Dictionary<String, Any>] = [
    ["name": "Raptors", "trainingDay": "March 18, 1pm"],
    ["name": "Sharks", "trainingDay": "March 17, 3pm"],
    ["name": "Dragons", "trainingDay": "March 17, 1pm"]
]

//Var to remember what team we have looped through on.
var currentTeam: Int = 0

//Function to group the players into experienced and novice. Also sorts height
func groupPlayers()  {
    
    var experiencedPlayers: [[Any]] = []
    var novicePlayers: [[Any]] = []
    
    //Temp var to keep track of loop
    var count = 0

    for player in players {
        
        //Experience preceeds height
        if player[2] as! Bool {
            experiencedPlayers.append([count, player[1]])
        } else {
            novicePlayers.append([count, player[1]])
        }
        
        count += 1
    }
    
    //Using the greedy method to assign players, sort them in height order.
    //http://www.americanscientist.org/issues/pub/the-easiest-hard-problem
    //Used this site to find out the fairest way to assign players
    
    let sortedExperienced = experiencedPlayers.sort { ($0[1] as? Double) > ($1[1] as? Double) }
    let sortedNovice = novicePlayers.sort { ($0[1] as? Double) < ($1[1] as? Double) }
    
    sortPlayers(sortedExperienced, typeOfPlayer: "experienced")
    sortPlayers(sortedNovice, typeOfPlayer: "novice")
}

//Step Two: Assign each player to team.
func sortPlayers (groupOfPlayers: [[Any]], typeOfPlayer: String) {
    for player in groupOfPlayers {
        
        players[player[0] as! Int].append(currentTeam)
        currentTeam += 1
        
        if currentTeam == teams.count {
            currentTeam = 0
        }
    }
    
}

//Step Three: Print letters to parents/ guardians
func printLetters() {
    for player in players {

        print("Hello \(player[3]), \n\(player[0]) has been chosen to play on team \(teams[player[4] as! Int]["name"]!), Go \(teams[player[4] as! Int]["name"]!)!!!.\nFirst practice is \(teams[player[4] as! Int]["trainingDay"]!)\n\n")
    }
}

//This is not really needed and sloppy, but added just to make sure distribution correct and heights are even as possible.
func checkingCriteria() {
    var raptorsExperienced = 0
    var sharksExperienced = 0
    var dragonsExperienced = 0
    
    var raptorsNovice = 0
    var sharksNovice = 0
    var dragonsNovice = 0
    
    var raptorsHeight: Double = 0
    var sharksHeight: Double = 0
    var dragonsHeight: Double = 0
    
    for player in players {
        if player[4] as! Int == 0 {
            if player[2] as! Bool {
                raptorsExperienced += 1
            } else {
                raptorsNovice += 1
            }
            raptorsHeight += player[1] as! Double
        } else if player[4] as! Int == 1 {
            if player[2] as! Bool {
                sharksExperienced += 1
            } else {
                sharksNovice += 1
            }
            sharksHeight += player[1] as! Double
        } else if player[4] as! Int == 2 {
            if player[2] as! Bool {
                dragonsExperienced += 1
            } else {
                dragonsNovice += 1
            }
            dragonsHeight += player[1] as! Double
        }
    }
    
    let raptorsAvg = raptorsHeight / 6
    let sharkAvg = sharksHeight / 6
    let dragonsAvg = dragonsHeight / 6
    
    print ("Raptors summary:\nExperienced \(raptorsExperienced)\nNovice: \(raptorsNovice)\nAvg Height \(raptorsAvg)\n")
    print ("Sharks summary:\nExperienced \(sharksExperienced)\nNovice: \(sharksNovice)\nAvg Height \(dragonsAvg)\n")
    print ("Dragons summary:\nExperienced \(dragonsExperienced)\nNovice: \(dragonsNovice)\nAvg Height \(sharkAvg)\n")
}

groupPlayers()
printLetters()
checkingCriteria()
































