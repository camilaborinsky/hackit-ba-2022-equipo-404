import express from "express"

const app = express()
app.use(express.json())
app.get("/", (req, res) => res.send("Express + Typescript Server Rockstar"))

app.post("/charges", (req, res) => {
	console.log("req===", req.body)
	//conseguir cuanto es que se necesita que se pague
	const price = req.body.price
	//enviar un mensaje a los servidores de todas las blockchains que banque este
	// usuario para que nos den una address con ese monto
	//conseguir las blockchains que banca este usuario
	//mandar el mansaje a ellas

	res.send("JOYA!")
})

export default app
