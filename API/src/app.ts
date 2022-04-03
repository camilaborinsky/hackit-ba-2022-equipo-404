import express, { response } from "express"

const app = express()
app.use(express.json())
app.use((req, res, next) => {
	//allow access from every, elminate CORS
	res.setHeader("Access-Control-Allow-Origin", "*")
	res.removeHeader("x-powered-by")
	//set the allowed HTTP methods to be requested
	res.setHeader("Access-Control-Allow-Methods", "POST")
	//headers clients can use in their requests
	res.setHeader("Access-Control-Allow-Headers", "Content-Type")
	//allow request to continue and be handled by routes
	next()
})
app.get("/", (req, res) => res.send("Express + Typescript Server Rockstar"))
let id = 2
const addresses = [
	{ currency: "bitcoinLN", address: "adsfadsf", amount: 0.000000923 },
	{ currency: "bnb", address: "adsfadsf", amount: 0.000000923 },
	{ currency: "xrp", address: "adsfasdf", amount: 0.000000923 },
	{ currency: "polygon", address: "adsfasdf", amount: 0.000000923 },
	{ currency: "cardano", address: "gsdfsdf", amount: 10 },
	{ currency: "usdt", address: "sdfgsdfg", amount: 0.000000923 },
	{ currency: "dai", address: "sdfgsdfg", amount: 0.000000923 },
]
const wallet = [
	{ currency: "bitcoinLN", abbreviation: "btcLN", amount: 0.023 },
	{ currency: "BNB", abbreviation: "BNB", amount: 0.48 },
	{ currency: "Ripple", abbreviation: "XRP", amount: 149 },
	{ currency: "Polygon", abbreviation: "MATIC", amount: 24 },
	{ currency: "cardano", abbreviation: "ADA", amount: 708 },
	{ currency: "TerraUSD", abbreviation: "UST", amount: 59 },
	{ currency: "Dai", abbreviation: "DAI", amount: 12 },
]

const chargeResponse = (price) => {
	id++
	return {
		price,
		id,
		addresses,
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
	res.send({ data: response })
})

app.get("/charges", (req, res) => {
	res.send({ data: charges })
})

app.get("/wallet", (req, res) => {
	res.send({ data: wallet })
})

export default app

const charges = [
	{
		id: 0,
		addresses,
		price: { currency: "ARS", amount: 1500 },
		state: "CONFIRMED",
	},
	{
		id: 1,
		addresses,
		price: { currency: "ARS", amount: 1800 },
		state: "PENDING",
	},
]
