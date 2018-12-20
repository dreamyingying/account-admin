package com.menglei.account.admin.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author 孟磊
 * @qq 199808090
 */

public class Md5Utils {
	private static final Logger LOGGER = LoggerFactory.getLogger(Md5Utils.class);

	/**
	 * 对字符串进行Md5加密
	 *
	 * @param input 原文
	 * @return md5后的密文
	 */
	public static String md5(String input) {
		byte[] code = null;
		try {
			code = MessageDigest.getInstance("md5").digest(input.getBytes());
		} catch (NoSuchAlgorithmException e) {
			code = input.getBytes();
		}
		BigInteger bi = new BigInteger(code);
		return bi.abs().toString(32).toUpperCase();
	}

	/**
	 * 对字符串进行Md5加密
	 *
	 * @param input 原文
	 * @param salt 随机数
	 * @return string
	 */
	public static String generatePasswordMD5(String input, String saltStr) {
		String salt = null;
		if (StringUtils.isEmpty(saltStr)) {
			salt = "";
		} else {
			salt = saltStr;
		}
		return md5(salt + md5(input));
	}

	public static void main(String[] args) {
		LOGGER.info(md5("111111"));
	}

}
