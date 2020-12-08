pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Optional functions from the ERC20 standard.
 */
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}

/**
 * @dev Collection of functions related to the address type,
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * > It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 *
 * _Since v2.5.0:_ this module is now much more gas efficient, given net gas
 * metering changes introduced in the Istanbul hardfork.
 */
contract ReentrancyGuard {
    bool private _notEntered;

    constructor () internal {
        // Storing an initial non-zero value makes deployment a bit more
        // expensive, but in exchange the refund on every call to nonReentrant
        // will be lower in amount. Since refunds are capped to a percetange of
        // the total transaction's gas, it is best to keep them low in cases
        // like this one, to increase the likelihood of the full refund coming
        // into effect.
        _notEntered = true;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_notEntered, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _notEntered = false;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _notEntered = true;
    }
}


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = msg.sender;
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

contract DefholdPools is Ownable, ReentrancyGuard {
	using SafeMath for uint256;
	using SafeERC20 for IERC20;
	using SafeERC20 for ERC20Detailed;
		
	IERC20 defholdLP; // The address of the DEFO-ETH Uniswap pool
	IERC20 defhold; // Defhold Token
	
	address private devAddress; // Dev Address
	
	uint256 public LONGESTFARMINGPOOLTIME; // Longest Farming pool time
	uint256 public LONGESTSTAKINGPOOLTIME; // Longest Staking pool time
	uint256 public LONGESTFARMINGPOOLID; // Longest Farming pool id
	uint256 public LONGESTSTAKINGPOOLID; // Longest Staking pool id
	uint256 public FARMPOOLCOUNT; // Farming pool Count
	uint256 public STAKINGPOOLCOUNT; // Staking pool Count
	
	uint256 private _divRate = 10000; // Using for div precentage rate
	
	// All pools will be available at any time (i.e. there will be no commencement date). 
	// Each investor can join the desired pool whenever he wants. 
	// The end of his lock-up period will be calculated automatically by the Smart Contract.
	// Moreover, each time a pool reaches the lock-up period of a faster pool, investors’ funds will be automatically transferred into the faster pool 
	// (in this case the EWF and rewards will automatically change to match those of the pool in which the tokens are transferred).
	
	// Info of each pool.
	struct PoolLists{
		bool is_farming; // true is farming pool, false is staking pool
		string pool_name; // Pool Name
		uint256 EWFTime; // Early Withdraw Fee Time limit in second
		uint256 EWFRate; // Early Withdraw Fee Rate with mul 10000
		uint256 totalUsers; // Total User Join
		uint256 activeAmount; // Total active amount
		uint256 overTimeAmount; // Total over time amount
		uint256 totalAmount; // Total amount
		uint256 activeDeposit; // total of active Farming deposit 
		uint256 depositCount; // total of Farming deposit 
		uint256 depositIndex; // last over time deposit index
		uint256 fasterPoolTime; // faster pool time
		uint256 fasterPoolId; // faster pool id
		uint256 pendingEWFReward; // Pending EWFReward
	}
	
	// Info of active deposit .
	struct DepositList {
		address account; // User address
		uint256 timeStart; // Farming started 
		uint256 timeEnd; // Farming ended 
		uint256 amount; // amount of deposit
		bool is_active; // 1 = active deposite
	}
			
	// Info of each user on pool.
	struct UserList {
		uint256 activeAmount; // active amount
        uint256 overTimeAmount; // over time amount
        uint256 totalAmount; // total amount
		uint256 pendingReward; // claimable reward 
		uint256 pendingRewardLP; // claimable reward 
        uint256 claimReward; // total claim DEFO reward
        uint256 claimRewardLP; // total claim LP token reward
    }
		
	PoolLists[] public poolLists;
	mapping (uint256 => mapping (uint256 => DepositList)) public depositList;
	mapping (uint256 => mapping (address => UserList)) public userList;
	mapping(uint => address[]) private poolDatas;
		
	struct PoolTemp {
		uint256 pid;
		uint256 poolCount;
		uint256 depositAmount;
		address poolTokenAddress;
		uint256 depositCount;
		address account;
		uint256 timeStart;
		uint256 timeEnd;
		uint256 amount;
		uint256 counter;
		uint256 counter2;
		uint256 fasterPoolTime;
		uint256 fasterPoolId;
		uint256 remainTime;
		uint256 pendingReward;
		uint256 pendingRewardLP;
		uint256 activeAmount;
		uint256 penaltyAmount;
		uint256 withdrawAmount;
		uint256 overTimeAmount;
		uint256 farmAmount;
		uint256 stakeAmount;
		uint256 farmRewardAmount;
		uint256 stakeRewardAmount;
		uint256 devRewardAmount;
		uint256 farmUsers;
		uint256 stakeUsers;
		uint256 totalAmount;
		uint256 rewardShare;
		uint256 rewardAmount;
		uint256 pendingEWFReward;
		bool is_active;
	}
		
	constructor(address _defholdLP, address _defhold, address _devAddress) public Ownable() {	
		defholdLP = IERC20(_defholdLP);
		defhold = IERC20(_defhold);
		devAddress = _devAddress;
		
		_initialPool();
	}
	
	function _initialPool() internal {
		_addPool(false, "1st Pool", 300, 100);
		_addPool(false, "2nd Pool", 600, 350);
		_addPool(false, "3rd Pool", 900, 820);
		_addPool(false, "4th Pool", 1200, 1430);
		_addPool(false, "5th Pool", 1500, 3330);
		
		_addPool(true, "1st Pool", 300, 200);
		_addPool(true, "2nd Pool", 600, 700);
		_addPool(true, "3rd Pool", 900, 1630);
		_addPool(true, "4th Pool", 1200, 2860);
		_addPool(true, "5th Pool", 1500, 6660);
	}
	
	function _addPool(bool _is_farming, string memory _pool_name, uint256 _EWFTime, uint256 _EWFRate) internal {
		PoolTemp memory temp;
		
		temp.poolCount = poolLists.length;
				
		if(_is_farming){
			if(FARMPOOLCOUNT == 0){
				temp.fasterPoolId = 0;
				temp.fasterPoolTime = 0;
			} else {
				temp.fasterPoolId = LONGESTFARMINGPOOLID;
				temp.fasterPoolTime = LONGESTFARMINGPOOLTIME;
			}
			
			FARMPOOLCOUNT += 1;
			LONGESTFARMINGPOOLID = temp.poolCount;
			LONGESTFARMINGPOOLTIME = _EWFTime;
		} else {
			if(STAKINGPOOLCOUNT == 0){
				temp.fasterPoolId = 0;
				temp.fasterPoolTime = 0;
			} else {
				temp.fasterPoolId = LONGESTSTAKINGPOOLID;
				temp.fasterPoolTime = LONGESTSTAKINGPOOLTIME;
			}
			
			STAKINGPOOLCOUNT += 1;
			LONGESTSTAKINGPOOLID = temp.poolCount;
			LONGESTSTAKINGPOOLTIME = _EWFTime;
		}
		
		poolLists.push(PoolLists(_is_farming, _pool_name, _EWFTime, _EWFRate, 0, 0, 0, 0, 0, 0, 0, temp.fasterPoolTime, temp.fasterPoolId, 0));
	}
	
	function addPool(bool _is_farming, string calldata _pool_name, uint256 _EWFTime, uint256 _EWFRate) external onlyOwner {
		_addPool(_is_farming, _pool_name, _EWFTime, _EWFRate);
	}
	 // Deposits in the specified pool to start
	function deposit(uint256 _pid, uint256 _amount) external nonReentrant {    
		PoolTemp memory temp;
		//Check Deposit amount
		require(_amount > 0, "deposit something");
		//Check Pool
		uint256 countPool = poolLists.length;
		require(_pid < countPool, "Not a valid Pool");
		
		_updatePool(_pid);
			
		if(userList[_pid][msg.sender].totalAmount == 0){
			poolLists[_pid].totalUsers += 1;
			poolDatas[_pid].push(msg.sender);
		}
		
		if(poolLists[_pid].is_farming){
			temp.poolTokenAddress = address(defholdLP);
		} else {
			temp.poolTokenAddress = address(defhold);
		}
		
		temp.depositAmount = _amount;
		
		IERC20(temp.poolTokenAddress).safeTransferFrom(msg.sender, address(this), temp.depositAmount);
		
		temp.timeStart = now;
		temp.timeEnd = now + poolLists[_pid].EWFTime;
		temp.depositCount = poolLists[_pid].depositCount;
		
		depositList[_pid][temp.depositCount].account = msg.sender;
		depositList[_pid][temp.depositCount].timeStart = temp.timeStart;
		depositList[_pid][temp.depositCount].timeEnd = temp.timeEnd;
		depositList[_pid][temp.depositCount].amount = temp.depositAmount;
		depositList[_pid][temp.depositCount].is_active = true;
		
		poolLists[_pid].activeDeposit += 1;
		poolLists[_pid].depositCount += 1;
		poolLists[_pid].totalAmount += temp.depositAmount;
		poolLists[_pid].activeAmount += temp.depositAmount;
		
		temp.pendingEWFReward = poolLists[_pid].pendingEWFReward;
		
		userList[_pid][msg.sender].activeAmount += temp.depositAmount;
		userList[_pid][msg.sender].totalAmount += temp.depositAmount;
		if(temp.pendingEWFReward > 0){
			poolLists[_pid].pendingEWFReward = 0;
			EWFReward(_pid, temp.pendingEWFReward);
		}
		emit Deposit(msg.sender, _pid, temp.timeStart, temp.timeEnd ,temp.depositAmount);
	}
		
	function _updatePool(uint256 _pid) internal {
		PoolTemp memory temp;
		
		temp.fasterPoolTime = poolLists[_pid].fasterPoolTime;
		temp.fasterPoolId = poolLists[_pid].fasterPoolId;
		
		if(poolLists[_pid].activeDeposit > 0){
			for(temp.counter = poolLists[_pid].depositIndex; temp.counter < poolLists[_pid].depositCount;temp.counter++){
				temp.is_active = depositList[_pid][temp.counter].is_active;
				temp.remainTime = 0;
				
				if(temp.is_active){
					temp.account = depositList[_pid][temp.counter].account;
					temp.timeStart = depositList[_pid][temp.counter].timeStart;
					temp.timeEnd = depositList[_pid][temp.counter].timeEnd;
					temp.amount = depositList[_pid][temp.counter].amount;
					
					if(temp.timeEnd > now){
						temp.remainTime = temp.timeEnd - now;
					}
					
					if(temp.fasterPoolTime >= temp.remainTime){
						poolLists[_pid].activeDeposit -= 1;
						poolLists[_pid].depositIndex = temp.counter + 1;
						poolLists[_pid].activeAmount -= temp.amount;
						
						delete depositList[_pid][temp.counter];
						
						if(_pid == temp.fasterPoolId){
							poolLists[_pid].overTimeAmount += temp.amount;
							userList[_pid][temp.account].overTimeAmount += temp.amount;
							userList[_pid][temp.account].activeAmount -= temp.amount;
						} else {
							
							temp.pendingReward = userList[_pid][temp.account].pendingReward;	
							temp.pendingRewardLP = userList[_pid][temp.account].pendingRewardLP;	
							
							poolLists[_pid].totalAmount -= temp.amount;
							userList[_pid][temp.account].activeAmount -= temp.amount;						
							userList[_pid][temp.account].totalAmount -= temp.amount;						
							userList[_pid][temp.account].pendingReward -= temp.pendingReward;
							userList[_pid][temp.account].pendingRewardLP -= temp.pendingRewardLP;
							
							if(userList[_pid][temp.account].totalAmount == 0){
								poolLists[_pid].totalUsers -= 1;
								if(poolLists[_pid].totalUsers  > 0){
									for(uint256 i = 0; i < poolDatas[_pid].length; i++) {
										if(poolDatas[_pid][i] == msg.sender){
											delete poolDatas[_pid][i];
											i = poolDatas[_pid].length;
										}
									}
								} else {
									delete poolDatas[_pid];
								}			
							}
							
							temp.depositCount = poolLists[temp.fasterPoolId].depositCount;
							
							if(userList[temp.fasterPoolId][temp.account].totalAmount == 0){
								poolLists[temp.fasterPoolId].totalUsers += 1;
								poolDatas[temp.fasterPoolId].push(temp.account);
							}
							
							poolLists[temp.fasterPoolId].activeDeposit += 1;
							poolLists[temp.fasterPoolId].depositCount += 1;
							poolLists[temp.fasterPoolId].totalAmount += temp.amount;
							poolLists[temp.fasterPoolId].activeAmount += temp.amount;
							
							depositList[temp.fasterPoolId][temp.depositCount].account = temp.account;
							depositList[temp.fasterPoolId][temp.depositCount].timeStart = temp.timeStart;
							depositList[temp.fasterPoolId][temp.depositCount].timeEnd = temp.timeEnd;
							depositList[temp.fasterPoolId][temp.depositCount].amount = temp.amount;
							depositList[temp.fasterPoolId][temp.depositCount].is_active = true;
							
							userList[temp.fasterPoolId][temp.account].activeAmount += temp.amount;
							userList[temp.fasterPoolId][temp.account].totalAmount += temp.amount;
							userList[temp.fasterPoolId][temp.account].pendingReward += temp.pendingReward;
							userList[temp.fasterPoolId][temp.account].pendingRewardLP += temp.pendingRewardLP;
						}
					}
				}
			}
		}
	}
		
	function TotalPool() public view returns (uint256) {
		return poolLists.length;
	}
	
	function percent(uint numerator, uint denominator, uint precision) internal pure returns(uint quotient) {
		uint _numerator  = numerator * 10 ** (precision+1);
		uint _quotient =  ((_numerator / denominator) + 5) / 10;
		return ( _quotient);
	}
	
	function claim() public nonReentrant {	
		PoolTemp memory temp;
		
		for(temp.counter = poolLists.length; temp.counter > 0;temp.counter--){
			temp.pid = temp.counter - 1;
			_updatePool(temp.pid);
		}
		
		_claim();
	}
	
	function _claim() internal {
		PoolTemp memory temp;
		
		temp.pendingReward = 0;
		temp.pendingRewardLP = 0;
		for(temp.counter = 0; temp.counter < poolLists.length;temp.counter++){
			temp.pendingReward += userList[temp.counter][msg.sender].pendingReward;
			temp.pendingRewardLP += userList[temp.counter][msg.sender].pendingRewardLP;
			
			userList[temp.counter][msg.sender].claimReward += userList[temp.counter][msg.sender].pendingReward;
			userList[temp.counter][msg.sender].pendingReward = 0;
			
			userList[temp.counter][msg.sender].claimRewardLP += userList[temp.counter][msg.sender].pendingRewardLP;
			userList[temp.counter][msg.sender].pendingRewardLP = 0;
		}
		
		if(temp.pendingReward > 0){
			defhold.safeTransfer(msg.sender, temp.pendingReward);
			emit ClaimReward(msg.sender, temp.pendingReward);
		}
		
		if(temp.pendingRewardLP > 0){
			defholdLP.safeTransfer(msg.sender, temp.pendingRewardLP);
			emit ClaimReward(msg.sender, temp.pendingRewardLP);
		}		
	}
		
	function withdraw(uint256 _pid) public nonReentrant {
		PoolTemp memory temp;
		
		uint256 countPool = poolLists.length;
		require(_pid < countPool, "Not a valid Pool");
		require(userList[_pid][msg.sender].totalAmount > 0, "not have withdrawn balance");
			
		_updatePool(_pid);
		
		_claim();
		
		temp.totalAmount = userList[_pid][msg.sender].totalAmount;
		temp.withdrawAmount = temp.totalAmount;
		temp.activeAmount = userList[_pid][msg.sender].activeAmount;
		temp.overTimeAmount = userList[_pid][msg.sender].overTimeAmount;
		temp.penaltyAmount = 0;
		
		if(temp.activeAmount > 0){
			temp.penaltyAmount = (temp.activeAmount * poolLists[_pid].EWFRate) / _divRate;
			emit PenaltyFee(msg.sender, _pid ,poolLists[_pid].EWFRate, temp.penaltyAmount);
			temp.withdrawAmount -= temp.penaltyAmount;
			
			for(temp.counter = poolLists[_pid].depositIndex; temp.counter < poolLists[_pid].depositCount;temp.counter++){
				temp.account = depositList[_pid][temp.counter].account;
				temp.timeStart = depositList[_pid][temp.counter].timeStart;
				temp.timeEnd = depositList[_pid][temp.counter].timeEnd;
				temp.amount = depositList[_pid][temp.counter].amount;
				temp.is_active = depositList[_pid][temp.counter].is_active;
				temp.remainTime = 0;
				
				if(temp.is_active){
					if(temp.account == msg.sender){
						delete depositList[_pid][temp.counter];
						poolLists[_pid].activeDeposit -= 1;
					}
				}
			}
		}
		
		if(poolLists[_pid].is_farming){
			temp.poolTokenAddress = address(defholdLP);
		} else {
			temp.poolTokenAddress = address(defhold);
		}
				
		IERC20(temp.poolTokenAddress).safeTransfer(msg.sender, temp.withdrawAmount);
		
		userList[_pid][msg.sender].activeAmount -= temp.activeAmount;
		userList[_pid][msg.sender].totalAmount -= temp.totalAmount;
		userList[_pid][msg.sender].overTimeAmount -= temp.overTimeAmount;
				
		poolLists[_pid].activeAmount -= temp.activeAmount;
		poolLists[_pid].totalAmount -= temp.totalAmount;
		poolLists[_pid].overTimeAmount -= temp.overTimeAmount;
		
		emit Withdraw(msg.sender, _pid ,temp.withdrawAmount);
		
		if(userList[_pid][temp.account].totalAmount == 0){
			poolLists[_pid].totalUsers -= 1;
			if(poolLists[_pid].totalUsers  > 0){
				for(uint256 i = 0; i < poolDatas[_pid].length; i++) {
					if(poolDatas[_pid][i] == msg.sender){
						delete poolDatas[_pid][i];
						i = poolDatas[_pid].length;
					}
				}
			} else {
				delete poolDatas[_pid];
			}			
		}

		EWFReward(_pid, temp.penaltyAmount);
	}
	
	function withdrawOverTime(uint256 _pid) public nonReentrant {
		PoolTemp memory temp;
		
		uint256 countPool = poolLists.length;
		require(_pid < countPool, "Not a valid Pool");
					
		_updatePool(_pid);
		_claim();
		
		temp.overTimeAmount = userList[_pid][msg.sender].overTimeAmount;
		temp.withdrawAmount = temp.overTimeAmount;

		require(temp.withdrawAmount > 0, "not have withdrawn balance");
						
		if(poolLists[_pid].is_farming){
			temp.poolTokenAddress = address(defholdLP);
		} else {
			temp.poolTokenAddress = address(defhold);
		}
				
		IERC20(temp.poolTokenAddress).safeTransfer(msg.sender, temp.withdrawAmount);
		
		userList[_pid][msg.sender].totalAmount -= temp.withdrawAmount;
		userList[_pid][msg.sender].overTimeAmount -= temp.withdrawAmount;
				
		poolLists[_pid].totalAmount -= temp.withdrawAmount;
		poolLists[_pid].overTimeAmount -= temp.withdrawAmount;
		
		emit WithdrawOverTime(msg.sender, _pid ,temp.withdrawAmount);
		
		if(userList[_pid][temp.account].totalAmount == 0){
			poolLists[_pid].totalUsers -= 1;
			if(poolLists[_pid].totalUsers  > 0){
				for(uint256 i = 0; i < poolDatas[_pid].length; i++) {
					if(poolDatas[_pid][i] == msg.sender){
						delete poolDatas[_pid][i];
						i = poolDatas[_pid].length;
					}
				}
			} else {
				delete poolDatas[_pid];
			}			
		}		
	}
	
	function EWFReward(uint _pid, uint256 _amount) internal {
		PoolTemp memory temp;
		
		if(poolLists[_pid].totalUsers > 0){
			for(temp.counter = 0; temp.counter < poolDatas[_pid].length;temp.counter++){
				temp.account = poolDatas[_pid][temp.counter];
				if(temp.account != address(0)){
					temp.rewardShare = percent(userList[_pid][temp.account].activeAmount, poolLists[_pid].activeAmount, 4);
					temp.rewardAmount = _amount * temp.rewardShare / _divRate;
					
					if(poolLists[_pid].is_farming){
						userList[_pid][temp.account].pendingRewardLP += temp.rewardAmount;
					} else {
						userList[_pid][temp.account].pendingReward += temp.rewardAmount;
					}
				}
			}	
		} else {
			poolLists[_pid].pendingEWFReward = _amount;
		}		
	}
	
	function externalReward(uint256 _amount) public nonReentrant {
		PoolTemp memory temp;
		
		defhold.safeTransferFrom(msg.sender, address(this), _amount);

		temp.farmRewardAmount = (_amount * 55) / 100; // 55% of reward supply
		temp.stakeRewardAmount = (_amount * 40) / 100; // 40% of reward supply
		temp.devRewardAmount = _amount - temp.farmRewardAmount - temp.stakeRewardAmount; // 5% of reward supply
		
		temp.farmAmount = 0;
		temp.stakeAmount = 0;
		
		temp.farmUsers = 0;
		temp.stakeUsers = 0;
		
		for(temp.counter = poolLists.length; temp.counter > 0;temp.counter--){
			temp.pid = temp.counter - 1;
			_updatePool(temp.pid);
			if(poolLists[temp.pid].is_farming){
				temp.farmAmount += poolLists[temp.pid].activeAmount;
				temp.farmUsers += poolLists[temp.pid].totalUsers;
			} else {
				temp.stakeAmount += poolLists[temp.pid].activeAmount;
				temp.stakeUsers += poolLists[temp.pid].totalUsers;
			}
		}
		
		if(temp.farmAmount == 0){
			temp.devRewardAmount += temp.farmRewardAmount;
			temp.farmRewardAmount = 0;
		}
		
		if(temp.stakeAmount == 0){
			temp.devRewardAmount += temp.stakeRewardAmount;
			temp.stakeRewardAmount = 0;
		}
		
		for(temp.counter = 0; temp.counter < poolLists.length;temp.counter++){
			for(temp.counter2 = 0; temp.counter2 < poolDatas[temp.counter].length;temp.counter2++){
				temp.account = poolDatas[temp.counter][temp.counter2];
				
				if(temp.account != address(0)){
					temp.activeAmount = userList[temp.counter][temp.account].activeAmount;
					if(temp.activeAmount > 0){
						if(poolLists[temp.counter].is_farming){
							if(temp.farmAmount > 0){
								temp.rewardShare = percent(userList[temp.counter][temp.account].activeAmount, temp.farmAmount, 4);
								temp.rewardAmount = temp.farmRewardAmount * temp.rewardShare / _divRate;
							}							
						} else {
							if(temp.stakeAmount > 0){
								temp.rewardShare = percent(userList[temp.counter][temp.account].activeAmount, temp.stakeAmount, 4);
								temp.rewardAmount = temp.stakeRewardAmount * temp.rewardShare / _divRate;
							}
						}
						
						userList[temp.counter][temp.account].pendingReward += temp.rewardAmount;
					}
				}
			}
		}
		
		if(temp.devRewardAmount > 0){
			defhold.safeTransfer(devAddress, temp.devRewardAmount);
		}
	}
	
	function updatePool(uint _pid) public nonReentrant {
		_updatePool(_pid);
	}
	
	function updateAllPool() public nonReentrant {
		PoolTemp memory temp;
		
		for(temp.counter = poolLists.length; temp.counter > 0;temp.counter--){
			temp.pid = temp.counter - 1;
			_updatePool(temp.pid);
		}
		
	}
	
	event Deposit(address indexed user, uint256 pool_id, uint256 timeStart, uint256 timeEnd, uint256 amount);
	event ClaimReward(address indexed user, uint256 amount);
	event PenaltyFee(address indexed user, uint256 pool_id, uint256 fee, uint256 amount);
	event Withdraw(address indexed user, uint256 pool_id, uint256 amount);
	event WithdrawOverTime(address indexed user, uint256 pool_id, uint256 amount);
}