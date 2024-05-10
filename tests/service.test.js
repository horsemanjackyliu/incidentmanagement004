const test_changeUrgencyDueToSubject = require('./code/test-changeUrgencyDueToSubject');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test changeUrgencyDueToSubject', async () => {
    await test_changeUrgencyDueToSubject(GET, POST, PATCH, DELETE, expect);
  });
});