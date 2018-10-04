// JavaScript Document
$(function () {
	$("#nextBtn").click(function () {
		$(".addPlPt1, .addNewPlaylistTitle").hide();
		$(".addPlPt2, .addNewPlaylistSong").show();
	});

	getAllPlaylists();

	function getAllPlaylists() {
		//Get All Playlists
		$.ajax({
			type: 'GET',
			url: './api/playlist',
			success: function (playlists) {				
				$('.playlistsContainer').html("");
				$.each(playlists.data, function (i, playlist) {
					
					$('.playlistsContainer').append(`
						<div class="singlePlaylist col-md-3">
						<button type="button" id="playBtn${playlist.id}" class="btnPlay"><i class="fas fa-play-circle"></i></button>
						<button type="button" data-id=${playlist.id} class="btnDelete"><i class="fas fa-trash-alt"></i></button>
						<button type="button" class="btnEdit" data-toggle="modal" data-target="#editPlaylistModal"><i data-id=${playlist.id} class="fas fa-edit"></i></button>
						<h4 class="playlistTitle">${playlist.name}</h4>
						<img class="img-fluid coverImg" src="${playlist.image}">
						`);
					
					$('.playlistTitle').arctext({
						radius: 150
					});

					$("#playBtn" + playlist.id).click(function () {
						$("#playlist").html('');
						$(".cdContainer").html('');
						$(".thePlayer").slideDown();
						$(".thePlayer").addClass("currentPlayr");

						//Show playlist cover
						$.ajax({
							type: 'GET',
							url: './api/playlist/' + playlist.id,
							success: function (playlist) {
								$(".cdContainer").append('<img class="img-fluid coverImg playerCoverImg rotator" src="' + playlist.data.image + '">');
							}
						});

						//Play a Playlist
						$.ajax({
							type: 'GET',
							url: './api/playlist/' + playlist.id + '/songs',
							success: function (songs) {
								$.each(songs.data.songs, function (i, song) {
									$("#playlist").append('<li><a class="singleSong" href="' + song.url + '">' + song.name + '</a> </li>');
								});
								$("#playlist :nth-child(1)").addClass("current-song");

								audioPlayer();

								function audioPlayer() {
									var currentSong = 0;
									$("#audioPlayer")[0].src = songs.data.songs[0].url;
									$("#audioPlayer")[0].play();
									$("#playlist li a").click(function (e) {
										e.preventDefault();
										$("#audioPlayer")[0].src = this;
										$("#audioPlayer")[0].play();
										$("#playlist li").removeClass("current-song");
										currentSong = $(this).parent().index();
										$(this).parent().addClass("current-song");
									});

									$("#audioPlayer")[0].addEventListener("ended", function () {
										currentSong++;
										if (currentSong == $("#playlist li a").length)
											currentSong = 0;
										$("#playlist li").removeClass("current-song");
										$("#playlist li:eq(" + currentSong + ")").addClass("current-song");
										$("#audioPlayer")[0].src = songs.data.songs[currentSong].url;
										$("#audioPlayer")[0].play();
									});


									$("#audioPlayer")[0].addEventListener("pause", function () {
										$(".playerCoverImg").removeClass("rotator");
									});
									$("#audioPlayer")[0].addEventListener("play", function () {
										$(".playerCoverImg").addClass("rotator");
									});
								}
							}
						});
					});
				});
			}
		});
	}
	var songFieldsArr = [1, 2, 3];
	$.each(songFieldsArr, function (i) {
		var SingleSongFields = '<div class="singleSong row"><div class="songUrlCont"><p>Song URL</p><input type="text" id="songURL' + [i] + '" aria-describedby="songURL" class="songUrl"></div><div class="songNameCont"><p>Name:</p><input type="text" class="songName" id="songName' + [i] + '" aria-describedby="songName"></div></div>';
		$(".addSingleSongCont").append(SingleSongFields);
	});
	var i = [2];
	$("#addAnotherSong").click(function () {
		i++;
		var addSingleSongFields = '<div class="singleSong row"><div class="songUrlCont"><p>Song URL</p><input type="text" class="songUrl" id="songURL' + [i] + '" aria-describedby="songURL"></div><div class="songNameCont"><p>Name:</p><input type="text" id ="songName' + [i] + '" aria-describedby="songName" class="songName"></div></div>';
		$(".addSingleSongCont").append(addSingleSongFields);
	});
	
	
	//Add a playlist
	//Preview Image
	$("#playlistUrl").change(function () {
		var imgInput = $("#playlistUrl").val();
		$("#image_upload_preview").attr("src", imgInput);
	});
	
	
	//Add a new playlist
	$("#addPlaylist").click(function () {

		var songArr = [];

		$(".songUrl").each((i) => {
			let tempSong = {
				name: $($(".songName")[i]).val(),
				url: $($(".songUrl")[i]).val()
			};
			songArr.push(tempSong);
		});


		$.ajax({
			url: "./api/playlist",
			type: "POST",
			dataType: "JSON",
			data: {
				name: $('.playlistName').val(),
				image: $('.playlistUrl').val(),
				songs: songArr

			},
			success: function (newPlaylist) {
				getAllPlaylists();
			},
			error: function () {
				alert(Error);
			}
		});
	});

//Update a playlist

	$("#editPlaylist").click(function (e) {
		let playlistId = e.target.dataset.id;
		
		var songArr = [];

		$(".editSongUrl").each((i) => {
			let tempSong = {
				name: $($(".editSongName")[i]).val(),
				url: $($(".editSongUrl")[i]).val()
			};
			songArr.push(tempSong);
		});

		$.ajax({
			url: `./api/playlist/${playlistId}`,
			type: "POST",
			dataType: "JSON",
			data: {
				name: $('.editPlaylistName').val(),
				image: $('.editPlaylistUrl').val(),
				songs: songArr
			},
			success: function (newPlaylist) {
				getAllPlaylists();
			},
			error: function () {
				alert(Error);
			}
		});
	});
	
	//Delete a playlist

	$(".btnDelete").click(function (e) {

		let playlistId = e.target.dataset.id;
		
		$.ajax({
			url: `./api/playlist/${playlistId}`,
			type: "DELETE",
			success: function (deleted) {
				console.log(deleted);
				getAllPlaylists();
			},
			error: function () {
				alert(Error);
			}
		});
	});
	
	
	//Show single playlist edit
	$(".playlistsContainer").on("click", ".btnEdit", (e) => {
		let playlistId = e.target.dataset.id;
		
		$("#editPlaylist").attr({"data-id":playlistId});

		$("#editSongsList").html('');
		$.get(`./api/playlist/${playlistId}`, function (data) {
			$(".editPlaylistName").val(data.data.name);
			$(".editPlaylistUrl").val(data.data.image);
			$("#image_upload_preview_edit").attr("src", data.data.image);

			$.get(`./api/playlist/${playlistId}/songs`, function (data) {
				$(data.data.songs).each((i, song) => {

					$(`<div class='editSongRow row'><p>Song URL: </p> <input class='editSongUrl' value='${song.url}'/> <p>Song Name:</p><input class='editSongName' value='${song.name}'/> </div>`).appendTo($("#editSongsList"));

				});
			});
		});
	});
});
