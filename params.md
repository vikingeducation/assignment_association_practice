 write the raw HTML which produces the following server output and params hash (no Rails helpers!). You won't be able to verify it until you've completed the sections below.

 Your Task

You will need to create a simple set of views and controllers to handle the following forms. Don't bother creating anything more than you need to in order to make this work on a very basic level.

All of the following take place in the NEW and EDIT pages for a Post which should include the most basic fields for adding/editing the title and body attributes. You will need to build a simple SHOW page as well to verify results and should probably output the flash to help with debugging, but that's up to you. Your pages will contain a number of forms that do essentially the same thing but using different input types.

Create a series of checkboxes to choose between Tags for the current (or new) Post by using form_for.
Verify that deselecting a checkbox will actually de-associate that tag.
Verify the form removes all associated tags when all checkboxes are unchecked.