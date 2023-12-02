extends Node

var resources = {
	"materials": 200,
	"gold": 200,
	"science": 200
}

var resourcesMultiplier = {
	"materials": 1,
	"gold": 1,
	"science": 1
}

var researchProgress = {
	"res1" = false,
	"res2" = false,
	"res3" = false,
	"res4" = false,
	"res11" = false,
	"res12" = false,
	"res21" = false,
	"res22" = false,
	"res31" = false,
	"res32" = false,
}

var passiveScienceIncome := 0
var passiveGoldIncome := 0
var passiveMaterialsIncome := 0
var passiveSavedRelics := 0.0
var passiveFoodIncome := 0.0
var automaticShelterBuilder := false
var automaticShelterImprover := false
var villagerWorkMultiplier := 1.0
var amountOfResearchDone := 0

var food := 0
var shelters := 0
var shelterExpansions := 0
var savedRelics := 0.0
var savedRelictsMultiplier := 1.0
var savedTech := 0.0
var completedIdols := 0.0

