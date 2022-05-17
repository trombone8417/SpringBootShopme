package com.shopme.admin.setting;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.shopme.common.entity.Setting;
import com.shopme.common.entity.SettingCategory;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class SettingRepositoryTests {

	@Autowired SettingRepository repo;

	@Test
	public void testCreateGeneralSettings() {
		Setting siteName = new Setting("SITE_NAME", "Shopme", SettingCategory.GENERAL);
		Setting siteLogo = new Setting("SITE_LOGO", "Shopme.png", SettingCategory.GENERAL);
		Setting copyright = new Setting("COPYRIGHT", "Copyright (C) 2022 Shopme Ltd.", SettingCategory.GENERAL);
		
		repo.saveAll(List.of(siteName, siteLogo, copyright));
		
		Iterable<Setting> iterable = repo.findAll();
		
		assertThat(iterable).size().isGreaterThanOrEqualTo(0);
	}
	
	@Test
	public void testCreateCurrencySettings() {
		Setting currencyId = new Setting("CURRENCY_ID", "1", SettingCategory.GENERAL);
		Setting symbol = new Setting("CURRENCY_SYMBOL", "$", SettingCategory.GENERAL);
		Setting symbolPosition = new Setting("CURRENCY_SYSBOL_POSITION", "before", SettingCategory.GENERAL);
		Setting decimalPointType = new Setting("DECIMAL_POINT_TYPE", "POINT", SettingCategory.GENERAL);
		Setting decimalDigits = new Setting("DECIMAL_DIGITS", "2", SettingCategory.GENERAL);
		Setting thousandsPointType = new Setting("THOUSANDS_POINT_TYPE", "COMMA", SettingCategory.GENERAL);
		
		repo.saveAll(List.of(currencyId, symbol, symbolPosition, decimalPointType,
				decimalDigits, thousandsPointType));
		
	}
}

















