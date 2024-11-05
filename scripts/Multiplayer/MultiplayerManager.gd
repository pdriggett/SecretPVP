extends Node

var public_ip = "159.203.53.99"
var port = 39811

#We're going to use this variable if we're a client not a server when we try to connect
#var client = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.has_feature("dedicated_server"):
		var server = ENetMultiplayerPeer.new()
		var result = server.create_server(port)
		multiplayer.multiplayer_peer = server
		
		if result == OK:
			print("Server is running on port ", port)
		else:
			print("Failed to start server on port ", port)
			
		#Lets double check we're a server
		print("multiplayer.is_server():" + str(multiplayer.is_server()))
		
		multiplayer.peer_connected.connect(_on_peer_connected)
		multiplayer.peer_disconnected.connect(_on_peer_disconnected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func connect_to_server() -> void:
	print("Attempting to connect to the server")
	var client = ENetMultiplayerPeer.new()
	var result = client.create_client(public_ip, port)
	multiplayer.multiplayer_peer = client
	
	if result == OK:
		print("Client initiated connection attempt.")
	else:
		print("Client failed to initiate connection attempt.")
	
	multiplayer.connected_to_server.connect(_connected_ok)
	multiplayer.connection_failed.connect(_connected_fail)
	
func _connected_ok() -> void:
	print("Successfully connected to the server")
	
func _connected_fail() -> void:
	print("Failed to connect to server")

func _on_peer_connected(id) -> void:
	print("Client connected with peer ID: ", id)
	
func _on_peer_disconnected(id) -> void:
	print("Client disconnected with peer ID: ", id)
