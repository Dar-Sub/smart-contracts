pragma solidity 0.5.6;

contract property transfer{
    address pulic DA;
    uint256 public totalNoProperty;
    function PropertyTransfer(){
        DA=msg.sender;
    }
    modify OnlyOwner(){
        require(msg.sender==DA);
    _;}
    struct property{
        string name;
        bool isSold;
    }
    mapping(address=> mapping(uint256 =>Property)) public propertiesOwner;
    mapping(address =>uint256)individualCountOfPropertyPerOwner;
    
    event PropertyAlloted(address indexed _verifiedOwner, uint256 indexed _totalNoOfPropertyCurrently, string _nameOfProperty, string _msg);
    event PropertyTransferred(address indexed _from, address indexed _to, string _propertyName, string _msg);
    function getpropertyCountOfAnyAddress(address _ownerAddress)constant returns (uint256){
        uint count=0;
        for(uint i=0;i<individualCountOfPropertyPerOwner[_ownerAddress];i++){
            if(propertiesOwner[_ownerAddress][i].issold!=true)
            count++;
        }
        return count;
    }  
    function allotPropperty(address _verifiedOwner, string _propertyName)OnlyOwner
    {
        propertiesOwner[_verifiedOwner][individualCountOfPropertyPerOwner][_verifiedOwner]++],name = _propertyname;
        totalNoProperty++;
        PropertyAlloted(_verifiedOwner, individualCountOfPropertyPerOwner[_verifiedOwner], _propertyName, "property Alloted successfully");
    }
    function isOwner(address _checkOwnerAddress, string _propertyName) constant returns (uint){
        uint i;
        bool flag;
        for(i=0;i<individualCountOfPropertyPerOwner[_checkOwnerAddress];i++)
        {
            if(propertiesOwner[_checkOwnerAddress][i].isSold==true){
                break;
            }
            flag = stringsEqual(propertiesOwner[_checkOwnerAddress][i].name,_propertyName);
            if(flag==true){
                break;
            }
        }
        if(flag==true){
            return i;
        }
        else{
            return 99999999;
        }
    }
    
    function stringsEqual (string a1, string a2) constant return(bool){
        return sha3(a1) ==sha3(a2)? true:false;
    }
    function transferProperty (address _to, string propertyName)
    returns (bool, uint)
    {
        uint256 checkOwner= isOwner (msg.sender, _propertyName);
        bool flag;
        if(checkOwner !=999999999 && propertiesOwner [msg.sender][checkOwner].isSold ==false){
            propertiesOwner [msg.sender][checkOwner].isSold = true;
            propertiesOwner [msg.sender][checkOwner].name = "Sold";
            propertiesOwner [_to][individualCountOfPropertyPerOwner[_to]++].name = _propertyName;
            flag = true;
            proprertyTransferred(msg.sender , _to, _propertyName, "Owner has been changed.");
        }
    }
}
else{
    flag=false;
    PropertiesTransferred(msg.sender, _to, _propertyName, "Owner doesn't own the property.")}
    return (flag, checkOwner);
    
