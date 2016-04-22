//Soccer Coordinator

//Step One: Players in own container
var joeSmith: Dictionary<String, Any> = ["name": "Joe Smith", "height": 42.0, "experience": true, "guardian": "Jim & Jan Smith"]
var jillTanner: Dictionary<String, Any> = ["name": "Jill Tanner", "height": 36.0, "experience": true, "guardian": "Clara Tanner"]
var billBon: Dictionary<String, Any> = ["name": "Bill Bon", "height": 43.0, "experience": true, "guardian": "Sara and Jenny Bon"]
var evaGordon: Dictionary<String, Any> = ["name": "Eva Gordon", "height": 45.0, "experience": false, "guardian": "Wendy and Mike Gordon"]
var mattGill: Dictionary<String, Any> = ["name": "Matt Gill", "height": 40.0, "experience": false, "guardian": "Charles and Sylvia Gill"]
var kimmyStein: Dictionary<String, Any> = ["name": "Kimmy Stein", "height": 41.0, "experience": false, "guardian": "Bill and Hillary Stein"]
var sammyAdams: Dictionary<String, Any> = ["name": "Sammy Adams", "height": 45.0, "experience": false, "guardian": "Jeff Adams"]
var karlSaygan: Dictionary<String, Any> = ["name": "Karl Saygan", "height": 42.0, "experience": true, "guardian": "Heather Bledsoe"]
var suzaneGreenberg: Dictionary<String, Any> = ["name": "Suzane Greenberg", "height": 44.0, "experience": true, "guardian": "Henrietta Dumas"]
var salDali: Dictionary<String, Any> = ["name": "Sal Dali", "height": 41.0, "experience": false, "guardian": "Gala Dali"]
var joeKavalier: Dictionary<String, Any> = ["name": "Joe Kavalier", "height": 39.0, "experience": false, "guardian": "Sam and Elaine Kavalier"]
var benFinkelstein: Dictionary<String, Any> = ["name": "Ben Finkelstein", "height": 44.0, "experience": false, "guardian": "Aaron and Jill Finkelstein"]
var diegoSoto: Dictionary<String, Any> = ["name": "Diego Soto", "height": 41.0, "experience": true, "guardian": "Robin and Sarika Soto"]
var choleAlaska: Dictionary<String, Any> = ["name": "Chloe Alaska", "height": 47.0, "experience": false, "guardian": "David and Jamie Alaska"]
var arnoldWillis: Dictionary<String, Any> = ["name": "Arnold Willis", "height": 43.0, "experience": false, "guardian": "Claire Willis"]
var phillipHelm: Dictionary<String, Any> = ["name": "Phillip Helm", "height": 44.0, "experience": true, "guardian": "Thomas Helm and Eva Jones"]
var lesClay: Dictionary<String, Any> = ["name": "Les Clay", "height": 42.0, "experience": true, "guardian": "Wynonna Brown"]
var herschelKrustofski: Dictionary<String, Any> = ["name": "Herschel Krustofski", "height": 45.0, "experience": true, "guardian": "Hyman and Rachel Krustofski"]

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
        if player["experience"] as! Bool {
            experiencedPlayers.append([count, player["height"]])
        } else {
            novicePlayers.append([count, player["height"]])
        }
        
        count += 1
    }
    
    //Using the greedy method to assign players, sort them in height order.
    //http://www.americanscientist.org/issues/pub/the-easiest-hard-problem
    //Used this site to find out the fairest way to assign players
    
    let sortedExperienced = experiencedPlayers.sort { ($0[1] as? Double) > ($1[1] as? Double) }
    let sortedNovice = novicePlayers.sort { ($0[1] as? Double) < ($1[1] as? Double) }
    
    sortPlayers(sortedExperienced)
    sortPlayers(sortedNovice)
}

//Step Two: Assign each player to team.
func sortPlayers (groupOfPlayers: [[Any]]) {
    for player in groupOfPlayers {
        
        players[player[0] as! Int]["assignedTeam"] = currentTeam
        currentTeam += 1
        
        if currentTeam == teams.count {
            currentTeam = 0
        }
    }
    
}

//Step Three: Print letters to parents/ guardians
func printLetters() {
    for player in players {

        print("Hello \(player["guardian"]!), \n\(player["name"]!) has been chosen to play on team \(teams[player["assignedTeam"] as! Int]["name"]!), Go \(teams[player["assignedTeam"] as! Int]["name"]!)!!!.\nFirst practice is \(teams[player["assignedTeam"] as! Int]["trainingDay"]!)\n\n")
    }
}

//This is not really needed and doesn't affect anything, but added to confirm that distribution is correct and heights are even as possible.
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
        if player["assignedTeam"] as! Int == 0 {
            if player["experience"] as! Bool {
                raptorsExperienced += 1
            } else {
                raptorsNovice += 1
            }
            raptorsHeight += player["height"] as! Double
        } else if player["assignedTeam"] as! Int == 1 {
            if player["experience"] as! Bool {
                sharksExperienced += 1
            } else {
                sharksNovice += 1
            }
            sharksHeight += player["height"] as! Double
        } else if player["assignedTeam"] as! Int == 2 {
            if player["experience"] as! Bool {
                dragonsExperienced += 1
            } else {
                dragonsNovice += 1
            }
            dragonsHeight += player["height"] as! Double
        }
    }
    
    let raptorsAvg: Double = raptorsHeight / (Double(players.count) / Double(teams.count))
    let sharkAvg: Double = sharksHeight / (Double(players.count) / Double(teams.count))
    let dragonsAvg: Double = dragonsHeight / (Double(players.count) / Double(teams.count))
    
    print ("Raptors summary:\nExperienced \(raptorsExperienced)\nNovice: \(raptorsNovice)\nAvg Height \(raptorsAvg)\n")
    print ("Sharks summary:\nExperienced \(sharksExperienced)\nNovice: \(sharksNovice)\nAvg Height \(dragonsAvg)\n")
    print ("Dragons summary:\nExperienced \(dragonsExperienced)\nNovice: \(dragonsNovice)\nAvg Height \(sharkAvg)\n")
}

groupPlayers()
printLetters()
checkingCriteria()
