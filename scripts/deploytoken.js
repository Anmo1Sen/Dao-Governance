async function main() {
  // Grab the contract factory 
  const MyToken = await ethers.getContractFactory("MyToken");

  // Start deployment, returning a promise that resolves to a contract object
  const myToken = await MyToken.deploy(); // Instance of the contract 
  console.log("Contract deployed to address:", myToken.address);
}

main()
 .then(() => process.exit(0))
 .catch(error => {
   console.error(error);
   process.exit(1);
 });

 //Contract deployed to address: 0x4E53811d69A6877cE56778645FFe864998Bce1e3