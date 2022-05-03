local delta = game:HttpGet("https://raw.githubusercontent.com/PotSmoker2137/spermadupacipa/main/delta.lua")
local ui = game:HttpGet("https://raw.githubusercontent.com/10009710009719100097119100/general-shoes/main/ui.lua")

writefile("ui_nxwr.lua", ui)

local games = {
    ['rushpoint'] = {2162282815};
    ['state of anarchy'] = {595270616};
    ['project delta'] = {2862098693};
}

if not isfolder('nxwr_games') then
    makefolder('nxwr_games');
    writefile("nxwr_games/project delta.lua", delta)
end

repeat task.wait() until game:IsLoaded();

local filename = 'nxwr_games';
local files = {};

for i,v in next, listfiles(filename) do
    files[v:gsub(filename..'\\','')] = readfile(v);
end

do
    local found, gameName, gameScript = false, nil;
    for name,ids in next, games do
        if table.find(ids, game.GameId) and files[name..'.lua'] then
            found = true;
            gameScript = files[name..'.lua'];
            gameName = name;
            break
        end
    end
    if not found then
        gameScript = files['universal.lua'];
        gameName = 'universal';
    end

    print(found, gameName)

    if gameScript ~= nil then
        if isfile('ui_nxwr.lua') then
            loadstring(readfile('ui_nxwr.lua'))();
            library.title = 'Nxwr Projects | Project Delta GUI 0.1v - '..gameName;
            library.gamename = gameName;
            library:Init();
            repeat task.wait() until library.hasInit == true
            loadstring(gameScript)()
        end
    end
end
