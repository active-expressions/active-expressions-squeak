instruction decoding
pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex
	"Push Contents at Offset in Temp Vector bytecode."
	^ currentContext pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex