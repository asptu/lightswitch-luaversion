local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)

end)


local BlackSquare = 0
local WhiteSquare = 0


client:on('messageCreate', function(message)
    
    if message.content == 'start' then

    MessageContent = message.channel:send("started")
    MessageContent:addReaction('⬜')
    MessageContent:addReaction('⬛')

    end  
end)


client:on('reactionAdd', function (reaction, message)

        if reaction.message ~= MessageContent then return end

        if reaction.emojiName == '⬛' then
           BlackSquare = BlackSquare + 1
            print('Black')
            print(BlackSquare)

        else if reaction.emojiName == '⬜' then
           WhiteSquare = WhiteSquare + 1
            print('White')
            print(WhiteSquare)    
        end
    end

    if BlackSquare > WhiteSquare then
        print('Black is larger')
        MessageContent:setContent("https://cdn.discordapp.com/attachments/966571367917060096/967293249515573318/unknown.png")

    else if WhiteSquare > BlackSquare then
        print('White is larger')
        MessageContent:setContent("https://cdn.discordapp.com/attachments/966571367917060096/966574653256638484/switchon.png")

            end
        end
end)


client:on('reactionRemove', function (reaction)

    if reaction.message ~= MessageContent then return end
    
    if reaction.emojiName == '⬛' then
        BlackSquare = BlackSquare - 1
         print('Black')
         print(BlackSquare)

     else if reaction.emojiName == '⬜' then
        WhiteSquare = WhiteSquare - 1
         print('White')
         print(WhiteSquare)
        end
    end

    if BlackSquare > WhiteSquare then
        print('Black is larger')
        MessageContent:setContent("https://cdn.discordapp.com/attachments/966571367917060096/967293249515573318/unknown.png")


    else if WhiteSquare > BlackSquare then
        print('White is larger')
        MessageContent:setContent("https://cdn.discordapp.com/attachments/966571367917060096/966574653256638484/switchon.png")
            end
        end
end)



client:run("Bot "..io.open("./login.txt"):read())