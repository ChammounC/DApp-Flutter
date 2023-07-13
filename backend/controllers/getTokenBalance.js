const Moralis = require("moralis").default;

const getTokenBalance = async (req, res) => {
  const chain = req.query.chain;
  const address = req.query.address;

  console.log(typeof chain,chain);
  console.log(typeof address,address);
  try {
    await Moralis.start({
      apiKey: process.env.API_KEY,
    });

    const response = await Moralis.EvmApi.balance.getNativeBalance({
      address: address,
      chain: chain,
    });

    return res.status(200).json(
       response,
    );
  } catch (e) {
    return res.status(500).json({
      message: "Fetching the token balances has encountered an error",
      error: e,
    });
  }
};

module.exports = getTokenBalance;
