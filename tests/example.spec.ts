import { expect, test } from '@playwright/test';

test('has title', async ({ page }) => {
  console.log("BASE_URL", process.env.BASE_URL);
  await page.goto(process.env.BASE_URL + '/login/');

  await expect(page).toHaveURL(process.env.BASE_URL + '/login/');

  await expect(page.getByRole('img', { name: 'Logo SmartBiotic' })).toBeVisible();

  const header = page.getByRole('heading', {  level: 2 });
  await expect(header).toHaveText('Expert Interface');
});