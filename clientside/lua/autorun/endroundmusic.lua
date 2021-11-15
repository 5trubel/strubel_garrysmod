GPEndRoundMusic = {}

function GPEndRoundMusic:Initialize()
	if SERVER then
		if (file.Exists("sound", "GAME")) then
			if (file.Exists("sound/endroundmusic", "GAME")) then
				if (!file.Exists("sound/endroundmusic/traitor", "GAME") and !file.Exists("sound/endroundmusic/innocent", "GAME") and !file.Exists("sound/endroundmusic/timeout", "GAME")) then
					GPEndRoundMusic.noWinTypeFolders = true
				else
					GPEndRoundMusic.songs = {}
					GPEndRoundMusic.songs[WIN_INNOCENT] = {}
					GPEndRoundMusic.songs[WIN_TIMELIMIT] = {}
					GPEndRoundMusic.songs[WIN_TRAITOR] = {}
					GPEndRoundMusic.lastSongs = {[WIN_TRAITOR] = -1, [WIN_INNOCENT] = -1, [WIN_TIMELIMIT] = -1}
					GPEndRoundMusic.CSStrings = {[WIN_TRAITOR] = "t", [WIN_TIMELIMIT] = "to", [WIN_INNOCENT] = "i"}
					GPEndRoundMusic.songCount = 0
					GPEndRoundMusic.songCounts = {[WIN_TRAITOR] = 0, [WIN_INNOCENT] = 0, [WIN_TIMELIMIT] = 0}

					local title, author = nil, nil
					local files, directories = file.Find("sound/endroundmusic/traitor/*", "GAME")
					for _, v in pairs (files) do
						if (string.GetExtensionFromFilename(v) != "txt") then
							if (file.Exists("sound/endroundmusic/traitor/"..string.StripExtension(v)..".txt", "GAME")) then
								local lines = string.Explode("\n", string.Replace(file.Read("sound/endroundmusic/traitor/"..string.StripExtension(v)..".txt", "GAME"), "\r", ""))
								title, author = lines[1], lines[2]
								if !title or string.Trim(title) == "" then title = "TITLE ERROR!!!" end
								if !author or string.Trim(author) == "" then author = "AUTHOR ERROR!!!" end
							end
							local path = "endroundmusic/traitor/"..v;
							resource.AddFile("sound/"..path)
							table.insert(GPEndRoundMusic.songs[WIN_TRAITOR], {path = path, title = title, author = author})
							GPEndRoundMusic.songCount = GPEndRoundMusic.songCount + 1
							GPEndRoundMusic.songCounts[WIN_TRAITOR] = GPEndRoundMusic.songCounts[WIN_TRAITOR] + 1
						end
					end

					title, author = nil, nil
					files, directories = file.Find("sound/endroundmusic/timeout/*", "GAME")
					for _, v in pairs (files) do
						if (string.GetExtensionFromFilename(v) != "txt") then
							if (file.Exists("sound/endroundmusic/timeout/"..string.StripExtension(v)..".txt", "GAME")) then
								local lines = string.Explode("\n", string.Replace(file.Read("sound/endroundmusic/timeout/"..string.StripExtension(v)..".txt", "GAME"), "\r", ""))
								title, author = lines[1], lines[2]
								if !title or string.Trim(title) == "" then title = "TITLE ERROR!!!" end
								if !author or string.Trim(author) == "" then author = "AUTHOR ERROR!!!" end
							end
							local path = "endroundmusic/timeout/"..v;
							resource.AddFile("sound/"..path)
							table.insert(GPEndRoundMusic.songs[WIN_TIMELIMIT], {path = path, title = title, author = author})
							GPEndRoundMusic.songCount = GPEndRoundMusic.songCount + 1
							GPEndRoundMusic.songCounts[WIN_TIMELIMIT] = GPEndRoundMusic.songCounts[WIN_TIMELIMIT] + 1
						end
					end

					title, author = nil, nil
					files, directories = file.Find("sound/endroundmusic/innocent/*", "GAME")
					for _, v in pairs (files) do
						if (string.GetExtensionFromFilename(v) != "txt") then
							if (file.Exists("sound/endroundmusic/innocent/"..string.StripExtension(v)..".txt", "GAME")) then
								local lines = string.Explode("\n", string.Replace(file.Read("sound/endroundmusic/innocent/"..string.StripExtension(v)..".txt", "GAME"), "\r", ""))
								title, author = lines[1], lines[2]
								if !title or string.Trim(title) == "" then title = "TITLE ERROR!!!" end
								if !author or string.Trim(author) == "" then author = "AUTHOR ERROR!!!" end
							end
							local path = "endroundmusic/innocent/"..v;
							resource.AddFile("sound/"..path)
							table.insert(GPEndRoundMusic.songs[WIN_INNOCENT], {path = path, title = title, author = author})
							GPEndRoundMusic.songCount = GPEndRoundMusic.songCount + 1
							GPEndRoundMusic.songCounts[WIN_INNOCENT] = GPEndRoundMusic.songCounts[WIN_INNOCENT] + 1
						end
					end

					if (GPEndRoundMusic.songCount == 0) then
						GPEndRoundMusic.noSongs = true;
					end
				end
			else
				GPEndRoundMusic.noEndRoundMusicFolder = true
			end
		else
			GPEndRoundMusic.noSoundFolder = true
		end

		util.AddNetworkString("GPEndRoundMusic")
		util.AddNetworkString("GPEndRoundMusicError")

		hook.Add("TTTEndRound", "GPEndRoundMusic",
			function(result)
				if ((GPEndRoundMusic.noSoundFolder or GPEndRoundMusic.noEndRoundMusicFolder) and !GPEndRoundMusic.errorDisplayed and file.Exists("endroundsounds", "DATA")) then
					GPEndRoundMusic.errorDisplayed = true;
					net.Start("GPEndRoundMusicError")
						net.WriteString("It would seem like this server is still using an outdated version of this addon. It has been completely rescripted as of 28/07/2016. Please visit the workshop page.")
					net.Broadcast()
					return;
				end

				if (GPEndRoundMusic.noSoundFolder and !GPEndRoundMusic.errorDisplayed) then
					GPEndRoundMusic.errorDisplayed = true;
					net.Start("GPEndRoundMusicError")
						net.WriteString("No \"sound\" folder found inside the garrysmod root! Garry's Mod cannot create it for you.")
					net.Broadcast()
					return;
				end

				if (GPEndRoundMusic.noEndRoundMusicFolder and !GPEndRoundMusic.errorDisplayed) then
					GPEndRoundMusic.errorDisplayed = true;
					net.Start("GPEndRoundMusicError")
						net.WriteString("No \"endroundmusic\" folder found inside \"garrysmod\\sound\"! Garry's Mod cannot create it for you.")
					net.Broadcast()
					return;
				end

				if (GPEndRoundMusic.noWinTypeFolders and !GPEndRoundMusic.errorDisplayed) then
					GPEndRoundMusic.errorDisplayed = true;
					net.Start("GPEndRoundMusicError")
						net.WriteString("None of the following folders found inside \"garrysmod\\sound\\endroundmusic\": \"innocent\", \"timeout\", \"traitor\"! Garry's Mod cannot create them for you.")
					net.Broadcast()
					return;
				end

				if (GPEndRoundMusic.noSongs and !GPEndRoundMusic.errorDisplayed) then
					GPEndRoundMusic.errorDisplayed = true;
					net.Start("GPEndRoundMusicError")
						net.WriteString("No songs were found! Make sure you add some music files in the appropriate folders you created. You pair each music file with a .txt file of the same name, containing the song title on the first line and the author on the second.")
					net.Broadcast()
					return;
				end

				if (GPEndRoundMusic.errorDisplayed) then return end;

				local songCount = GPEndRoundMusic.songCounts[result]
				if (songCount == 0) then return end;

				net.Start("GPEndRoundMusic")
					randomSongIndex = math.max(1, math.random(1, songCount))

					if (songCount > 1) then
						while (randomSongIndex == GPEndRoundMusic.lastSongs[result]) do
							randomSongIndex = math.max(1, math.random(1, songCount))
						end
					end
					GPEndRoundMusic.lastSongs[result] = randomSongIndex;

					local song = GPEndRoundMusic.songs[result][randomSongIndex]
					local info = song.title and song.author
					net.WriteBool(info)
					net.WriteString(song.path)
					if (info) then
						net.WriteString(song.title)
						net.WriteString(song.author)
						net.WriteString(GPEndRoundMusic.CSStrings[result])
					end
				net.Broadcast()
			end
		)
	else
		net.Receive("GPEndRoundMusic", function(_)
			local info = net.ReadBool()
			local path = net.ReadString()
			surface.PlaySound(path)
			local title
			local author
			if (info) then
				title, author, winType = net.ReadString(), net.ReadString(), net.ReadString()
				GPEndRoundMusic.title = title
				GPEndRoundMusic.author = author
				GPEndRoundMusic.paintBox = true
				GPEndRoundMusic.boxStatus = 0
				GPEndRoundMusic.winType = winType
			end
		end)

		net.Receive("GPEndRoundMusicError",
			function(_)
				chat.AddText(Color(255, 0, 0), "[EndRoundMusic Error]: ", Color(255, 255, 255), net.ReadString())
			end
		)

		GPEndRoundMusic.title = nil
		GPEndRoundMusic.author = nil
		GPEndRoundMusic.paintBox = false
		GPEndRoundMusic.boxStatus = 0
		GPEndRoundMusic.colors = {i = Color(0, 255, 0, 255), t = Color(255, 0, 0, 255), to = Color(255, 255, 0, 255), ["white"] = Color(255, 255, 255, 255)}
		GPEndRoundMusic.winType = "white"

		hook.Add("HUDPaint", "GPEndRoundMusicTitleBox",
			function()
				if (GPEndRoundMusic.paintBox) then
					local fraction = 0
					if (GPEndRoundMusic.boxStatus <= 1) then
						fraction = GPEndRoundMusic.boxStatus
					elseif (GPEndRoundMusic.boxStatus <= 6) then
						fraction = 1
					elseif (GPEndRoundMusic.boxStatus <= 7) then
						fraction = math.max(1 - (GPEndRoundMusic.boxStatus - 6), 0)
					elseif (GPEndRoundMusic.boxStatus > 7) then
						GPEndRoundMusic.boxStatus = 0
						GPEndRoundMusic.paintBox = false
					end

					surface.SetDrawColor(0, 0, 0, 200)
					surface.SetFont("Trebuchet24")
					local width1, height1 = surface.GetTextSize(GPEndRoundMusic.title)
					local width2, height2 = surface.GetTextSize(GPEndRoundMusic.author)
					local width = math.max(width1, width2) + 10

					surface.DrawRect(-width + (width * fraction), 25, width, height1 + height2 + 15)
					surface.SetDrawColor(255, 255, 255, 255)
					surface.SetTextColor(GPEndRoundMusic.colors[GPEndRoundMusic.winType])
					surface.SetTextPos(-width + (width * fraction) + 5, 25 + 5)
					surface.DrawText(GPEndRoundMusic.author)
					surface.SetTextColor(GPEndRoundMusic.colors.white)
					surface.SetTextPos(-width + (width * fraction) + 5, 5 + height1 + 5 + 25)
					surface.DrawText(GPEndRoundMusic.title)
					GPEndRoundMusic.boxStatus = GPEndRoundMusic.boxStatus + FrameTime()
				end
			end
		)
	end
end

hook.Add("Initialize", "EndRoundMusicInit", GPEndRoundMusic.Initialize)