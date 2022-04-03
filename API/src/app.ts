import express from "express"

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
	{
		currency: "Bitcoin Lightning Network",
		abbreviation: "btcLN",
		address: "adsfadsf",
		amount: 0.000000923,
	},
	{
		currency: "Avalanche",
		abbreviation: "AVAX",
		address: "adsfadsf",
		amount: 0.000000923,
	},
	{
		currency: "Ripple",
		abbreviation: "XRP",
		address: "adsfasdf",
		amount: 0.000000923,
	},
	{
		currency: "Solana",
		abbreviation: "SOL",
		address: "aksldfja;sl",
		amount: 3.4,
	},
	{
		currency: "Polkadot",
		abbreviation: "DOT",
		address: "adsfasdf",
		amount: 0.000000923,
	},
	{
		currency: "TetherUSD TRC-20",
		abbreviation: "USDT-TRC20",
		address: "gsdfsdf",
		amount: 10,
	},
	{
		currency: "TerraUSD",
		abbreviation: "UST",
		address: "sdfgsdfg",
		amount: 0.000000923,
	},
	{
		currency: "nuARS",
		abbreviation: "nuARS",
		address: "sdfgsdfg",
		amount: 0.000000923,
	},
]
const wallet = [
	{
		currency: "Bitcoin Lightning Network",
		abbreviation: "btcLN",
		amount: 0.023,
	},
	{ currency: "Avalanche", abbreviation: "AVAX", amount: 0.48 },
	{ currency: "Solana", abbreviation: "SOL", amount: 2.8 },
	{ currency: "Ripple", abbreviation: "XRP", amount: 149 },
	{ currency: "Polkadot", abbreviation: "DOT", amount: 24 },
	{ currency: "TetherUSD TRC-20", abbreviation: "USDT-TRC20", amount: 708 },
	{ currency: "TerraUSD", abbreviation: "UST", amount: 59 },
	{ currency: "nuARS", abbreviation: "nuARS", amount: 8500 },
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
