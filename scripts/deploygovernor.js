async function main() {
    // Grab the contract factory 
    const MyGovernor = await ethers.getContractFactory("MyGovernor");
 
    // Start deployment, returning a promise that resolves to a contract object
    const myGovernor = await MyGovernor.deploy("0x4E53811d69A6877cE56778645FFe864998Bce1e3"); // Instance of the contract taking token contract address as input
    console.log("Contract deployed to address:", myGovernor.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });



   //Contract deployed to address: 0xb8F448073288dC3AD323c9258B794A6991aFf7dB