import { expect, test } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto(process.env.BASE_URL + '/login/');

  const header = page.getByRole('heading', {  level: 2 });
  await expect(header).toHaveText('Expert Interface');
});