

import Foundation
import SwiftUI
import Observation

@Observable
class DataModel {
    var inputIcons: [String] = [] // List to track selected icons

    // Icon dictionary organized by sections
    var iconSections: [String: [String: [String]]] = [
        // ✅ **Work Section**
        "Work": [
            "briefcase.fill": ["work", "job", "office", "career", "business", "employment", "full-time job", "corporate life", "workplace", "9 to 5"],
            "laptopcomputer": ["computer", "laptop", "technology", "remote work", "coding", "IT job", "working from home", "software development", "digital work", "programming"],
            "calendar.badge.clock": ["schedule", "calendar", "meeting", "appointments", "business planning", "work agenda", "task scheduling", "organizing tasks", "time management", "work deadlines"],
            "person.2.fill": ["team", "colleagues", "coworkers", "group project", "team collaboration", "workplace team", "corporate group", "business partners", "staff meeting", "working together"],
            "phone.fill": ["call", "conference call", "client meeting", "business call", "work communication", "customer service", "zoom call", "phone support", "office phone", "talk to client"],
            "doc.text.fill": ["document", "paperwork", "contracts", "official document", "legal paper", "work report", "pdf file", "proposal", "work draft", "company policy"],
            "chart.bar.fill": ["presentation", "business analytics", "sales report", "market trends", "work presentation", "company progress", "quarterly review", "team briefing", "performance review", "financial report"],
            "pencil.and.scribble": ["writing", "notes", "journaling", "taking meeting notes", "documentation", "content creation", "writing reports", "drafting emails", "idea brainstorming", "copywriting"],
            "folder.fill": ["files", "project management", "company files", "work documents", "client records", "archive", "important papers", "digital storage", "work-related materials", "file storage"],
            "clock.fill": ["time", "deadline", "working hours", "schedule task", "office hours", "productivity", "task duration", "timing management", "work session", "clock in"],
        ],

        // ✅ **Food Section**
        "Food": [
            "fork.knife.circle.fill": ["dinner", "eat", "meal", "restaurant", "fine dining", "dining out", "eating food", "restaurant meal", "meal prep", "dining experience","food"],
            "cup.and.saucer.fill": ["coffee", "tea", "morning drink", "caffeine fix", "espresso", "latte", "afternoon tea", "coffee break", "hot beverage", "chai latte"],
            "cart.fill": ["shopping", "grocery", "buy ingredients", "supermarket", "food supplies", "grocery store", "weekly shopping", "market visit", "shopping cart", "food essentials"],
            "popcorn.fill": ["snacks", "chips", "popcorn", "light food", "junk food", "movie snacks", "evening treats", "snack time", "small bites", "casual food"],
            "leaf.fill": ["healthy eating", "vegan", "vegetarian", "plant-based diet", "organic food", "nutritious meals", "eco-friendly eating", "fresh produce", "salads", "clean eating"],
            "birthday.cake.fill": ["cake", "birthday", "celebration", "dessert", "sweet treat", "baking", "party food", "special occasion", "homemade cake", "delicious dessert"],
            "wineglass.fill": ["wine", "drink", "alcohol", "beverage", "wine tasting", "bar night", "cocktail party", "red wine", "white wine", "celebration drink"],
            "takeoutbag.and.cup.and.straw.fill": ["fast food", "takeout", "delivery", "quick meal", "McDonald's", "drive-thru", "on-the-go food", "instant food", "food order", "casual dining"],
            "carrot.fill": ["vegetables", "organic food", "healthy snack", "raw veggies", "salad ingredients", "veggie diet", "nutritious food", "homegrown produce", "farm fresh", "superfoods"],
        ],

        // ✅ **Fitness/Gym Section**
        "Gym": [
            "dumbbell.fill": ["workout", "exercise", "gym", "training", "weightlifting", "muscle building", "strength training", "fitness routine", "barbell workout", "lifting weights"],
            "figure.run.circle.fill": ["run", "jogging", "morning run", "evening jog", "track running", "cardio workout", "outdoor running", "5k training", "endurance running", "daily jog"],
            "bicycle": ["bike", "cycling", "morning ride", "evening cycling", "road biking", "mountain biking", "spin class", "long distance cycling", "bike training", "outdoor adventure"],
            "figure.yoga": ["yoga", "meditation", "stretching", "relaxation", "yoga poses", "flexibility training", "mindfulness exercise", "breathing techniques", "yoga class", "deep breathing"],
            "sportscourt": ["sports", "court", "basketball", "tennis", "soccer", "volleyball", "football", "table tennis", "badminton", "team sports"],
            "figure.walk": ["walking", "strolling", "morning walk", "casual walk", "daily steps", "outdoor walk", "nature walk", "power walk", "relaxing walk", "city stroll"],
            "flame.fill": ["calories", "fat burn", "intense workout", "weight loss", "high intensity", "sweating session", "cardio burn", "active energy", "fitness goal", "HIIT session"],
            "figure.hiking": ["hiking", "trail walking", "mountain climbing", "adventure hike", "long distance walking", "nature trails", "outdoor fitness", "steep hills", "backpacking", "trekking"],
            "heart.circle.fill": ["heart rate", "pulse", "cardio health", "fitness tracking", "health monitor", "workout intensity", "heart monitoring", "vital signs", "exercise feedback", "heart strength"],
            "stopwatch.fill": ["timer", "stopwatch", "countdown", "interval training", "circuit training", "running time", "lap timer", "HIIT countdown", "workout clock", "time tracking"]
        ],


        // ✅ **Home Section**
        "Home": [
            "house.fill": ["home", "residence", "living space", "family house", "cozy home", "sweet home", "place to live", "apartment", "housing", "dream home"],
            "sofa.fill": ["sofa", "furniture", "living room", "home decor", "comfortable seating", "interior design", "couch", "family space", "home lounge", "relaxing space"],
            "bed.double.fill": ["bed", "sleep", "bedroom", "night rest", "comfortable bed", "nap time", "good night", "sleep schedule", "morning wakeup", "restful night"],
            "lamp.table.fill": ["lamp", "lighting", "table lamp", "bedside light", "home decor", "study light", "reading lamp", "soft lighting", "cozy glow", "night lamp"],
            "refrigerator.fill": ["fridge", "refrigerator", "cold storage", "food preservation", "kitchen appliance", "home cooling", "groceries storage", "drinks cooling", "household appliance", "kitchen essential"],
            "microwave.fill": ["microwave", "kitchen appliance", "heat food", "quick meal", "cooking gadget", "fast heating", "warm leftovers", "kitchen convenience", "household tool", "food preparation"],
            "washer.fill": ["washing machine", "laundry", "clothes washing", "spin cycle", "household chores", "home appliance", "fabric care", "clean laundry", "drying cycle", "detergent wash"],
            "toilet.fill": ["bathroom", "restroom", "toilet", "sanitary", "washroom", "clean space", "personal hygiene", "home sanitation", "toilet seat", "bathroom essentials"],
            "fan.fill": ["fan", "air circulation", "cooling", "ventilation", "summer breeze", "room cooling", "airflow", "electric fan", "cool air", "household fan"],
            "door.left.hand.open": ["door", "entryway", "home entrance", "front door", "house access", "exit door", "welcome home", "open house", "room door", "inside home"]
        ],


        // ✅ **Travel Section**
        "Travel": [
            "airplane": ["flight", "airport", "plane", "trip", "boarding pass", "air travel", "vacation trip", "travel abroad", "business flight", "tourism"],
            "tram.fill": ["train", "railway", "commute", "metro", "high-speed rail", "public transport", "underground train", "travel by rail", "city metro", "bullet train"],
            "bus.fill": ["bus", "public transport", "commute", "city bus", "long trip", "road travel", "bus station", "school bus", "daily ride", "bus stop"],
            "car.fill": ["car", "vehicle", "road trip", "driving", "personal transport", "car rental", "highway driving", "commuting", "long drive", "daily travel"],
            "bed.double.circle.fill": ["hotel", "accommodation", "stay", "vacation rental", "lodging", "sleepover", "holiday room", "business stay", "resort", "overnight stay"],
            "map.fill": ["map", "navigation", "directions", "travel guide", "wayfinding", "exploring", "route planner", "gps", "landmarks", "adventure travel"],
            "globe": ["world travel", "exploration", "international", "different countries", "tourist places", "vacation spots", "globetrotter", "planet", "earth view", "global adventure"],
            "backpack.fill": ["suitcase", "travel packing", "airport baggage", "carry-on", "long trip", "vacation packing", "flight luggage", "business travel", "baggage claim", "checked bag"],
            "safari": ["compass", "direction", "navigation tool", "exploration", "finding route", "north south", "adventure seeking", "location guide", "outdoor navigation", "travel companion"],
            "camera.fill": ["camera", "travel photography", "capture moments", "vacation memories", "selfie", "photo taking", "tourist photography", "landscape photography", "snap pictures", "adventure shots"]
            
        ],
        
        // ✅ **Drinks Section**
        "Drinks": [
            "cup.and.saucer.fill": ["coffee", "tea", "hot drink", "morning coffee", "afternoon tea", "relaxing drink", "caffeine boost", "espresso shot", "latte", "chai tea"],
          
            "wineglass.fill": ["wine", "alcohol", "red wine", "white wine", "wine glass", "happy hour", "celebration drink", "fine dining", "drinking night", "vineyard selection"],
            "mug.fill": ["hot chocolate", "cocoa drink", "steaming mug", "cozy drink", "winter beverage", "marshmallow cocoa", "sweet drink", "dessert drink", "milk-based drink", "warm treat"],
 
            "takeoutbag.and.cup.and.straw.fill": ["smoothie", "juice", "fruit drink", "blended beverage", "summer drink", "cold refreshment", "healthy juice", "protein shake", "organic smoothie", "vitamin drink"],
            "cart.fill": ["buy drinks", "grocery shopping", "beverage aisle", "pick up drinks", "store visit", "supermarket beverages", "shopping cart drinks", "alcohol purchase", "drinks for party", "bulk drinks"],
            "hand.thumbsup.fill": ["favorite drink", "best coffee", "highly rated drink", "top choice beverage", "fan favorite", "customer recommended", "most loved drink", "must-try", "great taste", "barista pick"],
            "snowflake": ["cold drinks", "iced coffee", "iced tea", "frozen beverage", "chilled refreshment", "cool summer drink", "refreshing ice drink", "cold brew", "frappuccino", "smoothie with ice"],
            "flame.fill": ["hot drinks", "winter drinks", "warm beverages", "spiced tea", "hot cider", "cozy drink", "steamy cup", "soothing warm drink", "best hot chocolate", "classic winter drinks"
                          ]
        ],

        // ✅ **Tomorrow Section**
        "Tomorrow": [
            "calendar.circle.fill": ["tomorrow", "next day", "future plan", "scheduled event", "date marked", "agenda", "to-do list", "morning schedule", "meeting ahead", "next step"],
            "clock.arrow.circlepath": ["reminder", "set alarm", "countdown", "wake up call", "deadline", "schedule task", "work ahead", "early morning", "plan ahead", "event notification"],
            "alarm.fill": ["alarm", "morning wakeup", "set timer", "daily reminder", "meeting time", "wake up early", "night clock", "morning routine", "task reminder", "countdown alert"],
            "hourglass.circle.fill": ["waiting", "countdown", "next event", "soon", "time is passing", "patience", "deadline approaching", "upcoming plan", "anticipation", "on hold"],
            "arrow.forward.circle.fill": ["future", "next step", "move forward", "keep going", "progress", "new beginning", "next phase", "keep pushing", "future planning", "advancing"],
            "checkmark.circle.fill": ["task completed", "done", "finished plan", "goal met", "successfully scheduled", "checked off", "completed work", "fulfilled commitment", "on time", "goal reached"],
            "moon.fill": ["night plans", "evening schedule", "midnight event", "tomorrow night", "late night work", "night task", "bedtime reminder", "prepare for tomorrow", "evening meeting", "midnight session"],
            "cloud.sun.fill": ["morning forecast", "weather tomorrow", "check temperature", "next day conditions", "daytime prediction", "cloudy tomorrow", "sunny morning", "rain prediction", "prepare for weather", "tomorrow’s climate"],
            "exclamationmark.triangle.fill": ["urgent task", "important event", "critical reminder", "must not forget", "priority work", "emergency schedule", "major deadline", "last chance", "serious commitment", "warning sign"],
            "person.fill.checkmark": ["personal task", "self-reminder", "my schedule", "my agenda", "daily checklist", "my commitment", "morning task", "evening to-do", "workload", "self-care reminder"]
        ],

        // ✅ **Family Section**
        "Family": [
            "person.3.fill": ["family", "together", "parents", "siblings", "home life", "relatives", "family gathering", "support system", "close bond", "loved ones"],
            "house.fill": ["home", "household", "family home", "living together", "safe space", "cozy house", "sweet home", "stay at home", "domestic life", "parenting"],
            "heart.fill": ["love", "affection", "caring", "strong bond", "family love", "connection", "support", "compassion", "togetherness", "close relationship"],
            "figure.walk.circle.fill": ["family walk", "outing", "walk with loved ones", "park visit", "weekend stroll", "spending time", "bonding time", "parent and child", "siblings walk", "group activity"],
            "gift.fill": ["present", "surprise gift", "birthday", "family celebration", "giving", "special occasion", "festive moment", "holiday gift", "wrapping gift", "happy moment"]
        ],

        // ✅ **Buy & Gift Section**
        "Buy & Gift": [
            "cart.fill": ["buy", "shopping", "purchase", "order", "grocery shopping", "online order", "store visit", "checkout", "add to cart", "buy items"],
            "bag.fill": ["shopping bag", "carry purchase", "store bag", "fashion buy", "mall visit", "retail shopping", "bag full", "store items", "grab a deal", "buy more"],
            "creditcard.fill": ["payment", "purchase transaction", "checkout", "online payment", "buy now", "cashless", "secure payment", "shopping complete", "credit card", "digital pay"],
            "gift.fill": ["gift", "present", "birthday gift", "surprise", "special moment", "holiday gift", "give something", "celebration", "gift box", "wrapped present"],
            "star.fill": ["special", "favorite", "top choice", "premium buy", "highlighted product", "luxury item", "best selection", "reward", "featured deal", "must-have"],
            "hand.thumbsup.fill": ["best choice", "top rated", "recommendation", "most popular", "highly preferred", "customer favorite", "trusted selection", "fan favorite", "best seller", "highly reviewed"],
            "hand.tap.fill": ["select item", "tap to buy", "choose product", "decision making", "checkout selection", "pick item", "confirm order", "tap to select", "e-commerce action", "interactive buy"],
            "wand.and.stars": ["special deal", "limited offer", "magic discount", "exclusive sale", "one-time deal", "holiday special", "coupon offer", "membership bonus", "flash sale", "surprise discount"],
            "person.fill.checkmark": ["personal purchase", "self-buy", "my shopping", "selected items", "saved for later", "wishlist checkout", "completed order", "cart review", "payment verified", "successful purchase"]
        ]

    ]


    var searchText = "" // Search text entered by the user
    var pickerSearchText = "" // Separate search for the icon picker

    // **Default icons (all icons combined from all sections)**
    var defaultIcons: [String] {
        return iconSections.values.flatMap { $0.keys }
    }

    // **Filter for Input (Dynamic Change While Typing)**
    var iconFilter: [String] {
        let lowercaseInput = searchText.lowercased().trimmingCharacters(in: .whitespaces)

        // If the input is empty, return checklist as the default
        if lowercaseInput.isEmpty {
            return ["checklist"]
        }

        let words = lowercaseInput.split(separator: " ").map { String($0) }
        var matchedIcons: [String] = []

        // **Step 1: Check for exact phrase matches**
        for (_, icons) in iconSections {
            for (icon, keywords) in icons {
                if keywords.contains(lowercaseInput) {
                    return [icon] // Immediately return if there is an exact phrase match
                }
            }
        }

        // **Step 2: Check for partial matches by iterating over words**
        for word in words.reversed() { // Start from the last typed word
            for (_, icons) in iconSections {
                for (icon, keywords) in icons {
                    if keywords.contains(word) {
                        if !matchedIcons.contains(icon) {
                            matchedIcons.append(icon) // Add icons that match each word
                        }
                    }
                }
            }
        }

        // **Step 3: Return prioritized matches (latest relevant word)**
        return !matchedIcons.isEmpty ? matchedIcons : ["checklist"]
    }


    // **New Filter for Icon Picker (By Default Displays All Icons in Sections)**
    func filteredSections(searchText: String) -> [String: [String]] {
        let lowercaseInput = searchText.lowercased().trimmingCharacters(in: .whitespaces)
        var filteredSections: [String: [String]] = [:]

        for (section, icons) in iconSections {
            if lowercaseInput.isEmpty || section.lowercased().contains(lowercaseInput) {
                filteredSections[section] = Array(icons.keys) // ✅ Show all icons in section
            } else {
                let matchedIcons = icons.filter { (_, keywords) in
                    keywords.contains(where: { $0.contains(lowercaseInput) })
                }.map { $0.key }
                
                if !matchedIcons.isEmpty {
                    filteredSections[section] = matchedIcons
                }
            }
        }
        return filteredSections
    }
}
