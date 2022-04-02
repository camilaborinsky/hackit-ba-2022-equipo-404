import express, { response } from "express"

const app = express()
app.use(express.json())
app.get("/", (req, res) => res.send("Express + Typescript Server Rockstar"))
let id = 2
const chargeResponse = (price) => {
	id++
	return {
		price,
		id,
		addresses: {
			bitcoinLN: { address: "", amount: 0.000000923 },
			bnb: { address: "", amount: 0.000000923 },
			xrp: { address: "", amount: 0.000000923 },
			polygon: { address: "", amount: 0.000000923 },
			cardano: { address: "", amount: 10 },
			usdt: { address: "", amount: 0.000000923 },
			dai: { address: "", amount: 0.000000923 },
		},
		state: "PENDING",
	}
}
app.post("/charges", (req, res) => {
	console.log("req===", req.body)
	//conseguir cuanto es que se necesita que se pague
	const price = req.body.price
	//enviar un mensaje a los servidores de todas las blockchains que banque este
	// usuario para que nos den una address con ese monto
	//conseguir las blockchains que banca este usuario
	//mandar el mansaje a ellas
	const response = chargeResponse(price)
	charges.push(response)
	res.send(response)
})

app.get("/charges", (req, res) => {
	res.send(charges)
})

export default app

const charges = [
	{ id: 0, price: { currency: "ARS", amount: 1500 }, state: "CONFIRMED" },
	{ id: 1, price: { currency: "ARS", amount: 1800 }, state: "PENDING" },
]
